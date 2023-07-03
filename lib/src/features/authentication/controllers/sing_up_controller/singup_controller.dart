import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/features/authentication/models/user_model.dart';
import 'package:quiz_app/src/repository/authentication_repository/authentiocation_repository.dart';
import 'package:quiz_app/src/repository/user_repository/user_repository.dart';

import '../../screen/forgot_password/forgot_password_otp/forgot_password_otp.dart';

class SingUpController extends GetxController{

  static SingUpController get instance => Get.find();

  final userRep = Get.put(UserRepository());

  // TextField Controllers get from data to Text fields.

 final email = TextEditingController();
 final password = TextEditingController();
 final fullName = TextEditingController();
 final phoneNo = TextEditingController();

 void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
 }
  Future<void>  createUser (UserModel user) async {
   await userRep.createUser1(user);
   phoneAuthentication(user.phoneNumber);
   Get.to(ForgotPasswordOtp());
  }


void  phoneAuthentication(String phoneNo){
  AuthenticationRepository.instance.phoneAuthentication(phoneNo);
}

}