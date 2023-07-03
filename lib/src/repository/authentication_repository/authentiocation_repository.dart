import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/src/features/authentication/screen/welcome_design_screen/welcome_screen_design.dart';
import 'package:quiz_app/src/repository/authentication_repository/exceptions/singup_email_password_failure.dart';

import '../../features/authentication/screen/dashboard_screen/dashboatd_screen.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Variable
 final _auth = FirebaseAuth.instance;
 late final Rx<User?> firebaseUser;
 var verificationId = ''.obs;


 @override
  void onReady(){
   Future.delayed(const Duration(seconds: 6));
   firebaseUser = Rx<User?>(_auth.currentUser);
   firebaseUser.bindStream(_auth.userChanges());
   ever(firebaseUser, setInitialScreen);
 }

// first where screen go
  setInitialScreen(User? user) {
   user == null ? Get.off(() => const WelcomeScreenDesign()) : Get.offAll(()=> const DashBoardScreen());
  }
// for singup phone number
  Future<void>phoneAuthentication(String phoneNo) async {

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid.');
        }else{
          Get.snackbar('Error', 'Something went wrong.Try again');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
         this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }


  //for otp phone number
  Future<bool>verifyOtp(String otp) async {
   var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId:verificationId.value, smsCode: otp));

   return credentials.user != null ? true : false;
  }
// for email and password singup
  Future<void> createUserWithEmailAndPassword(String email,String password) async{
  try{
     await _auth.createUserWithEmailAndPassword(
       email: email,
       password: password,
     );
     firebaseUser.value != null ? Get.offAll(()=> const DashBoardScreen()) : Get.offAll(()=> WelcomeScreenDesign()) ;
  }on FirebaseAuthException catch(e){
    final ex= SingUpEmailPasswordFailure.code(e.code);
    print('Firebase Exception-  ${ex.message}');
    throw ex;
  }catch(_){
    const ex= SingUpEmailPasswordFailure();
    print('Exception - ${ex.message}');
    throw ex;
  }

 }
//for sing in
  Future<void> signInWithEmailAndPassword(String email,String password) async{
    try{
       await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }on FirebaseAuthException catch(e){

    }catch(_){}

  }
// for singOut function
  Future<void> logout() async => await _auth.signOut();



}