import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/features/authentication/screen/dashboard_screen/dashboatd_screen.dart';

import '../../../../repository/authentication_repository/authentiocation_repository.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  Future<void> verifyOtp1(String otp) async {
    var isVerified = await  AuthenticationRepository.instance.verifyOtp(otp);
    isVerified ? Get.offAll(const DashBoardScreen()) : Get.back();
  }
}