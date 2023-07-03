import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void>createUser1(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(
            () => Get.snackbar('Success', 'Your Account is created',
            snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
    ).catchError((error) => Get.snackbar('Error', 'Something is wrong,Try Again',
            snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),),

    );
  }
}
