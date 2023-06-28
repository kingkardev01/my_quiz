import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/repository/authentication_repository/authentiocation_repository.dart';

class SingUpController extends GetxController{

  static SingUpController get instance => Get.find();

  // TextField Controllers get from data to Text fields.

 final email = TextEditingController();
 final password = TextEditingController();
 final fullName = TextEditingController();
 final phoneNo = TextEditingController();

 void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
 }

}