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

 @override
  void onReady(){
   Future.delayed(const Duration(seconds: 6));
   firebaseUser = Rx<User?>(_auth.currentUser);
   firebaseUser.bindStream(_auth.userChanges());
   ever(firebaseUser, setInitialScreen);
 }


  setInitialScreen(User? user) {
   user == null ? Get.off(() => const WelcomeScreenDesign()) : Get.offAll(()=> const DashBoardScreen());
  }

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

  Future<void> signInWithEmailAndPassword(String email,String password) async{
    try{
       await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }on FirebaseAuthException catch(e){

    }catch(_){}

  }

  Future<void> logout() async => await _auth.signOut();



}