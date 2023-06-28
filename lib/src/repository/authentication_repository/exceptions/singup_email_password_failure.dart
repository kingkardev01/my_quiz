import 'package:flutter/material.dart';

class SingUpEmailPasswordFailure{

  final String message;

   const SingUpEmailPasswordFailure([this.message = "An Unknown error occurred"]);

 factory SingUpEmailPasswordFailure.code(String code){
   switch (code){
     case 'weak-password' :
       return  const SingUpEmailPasswordFailure('Please enter A Stronger Password');
     case 'invalid-email' :
       return const SingUpEmailPasswordFailure('Email is not valid or badly formatted.');
     case 'email-already-in-use' :
       return const SingUpEmailPasswordFailure('An account already exists for that email.');
     case 'operation-not-allowed' :
       return const SingUpEmailPasswordFailure('Operation is not allowed. Please contact support.');
     case 'user-disabled' :
       return const SingUpEmailPasswordFailure('This user has been disabled. Please contact support for help.');
       default:
       return const SingUpEmailPasswordFailure();
   }
 }

}