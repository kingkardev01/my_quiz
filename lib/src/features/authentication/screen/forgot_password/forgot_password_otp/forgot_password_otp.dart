import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/authentication/controllers/otp_controller/otp_controller.dart';
import 'package:quiz_app/src/features/authentication/screen/login_screen/login.dart';

import '../../../../../constants/text_constants/text.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class ForgotPasswordOtp extends StatelessWidget {
  const ForgotPasswordOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: height *0.3,),
                    Container(
                      child: Text("Quiz App",style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black),),
                    ),
                    Text(tOptSubTitle.toUpperCase(),style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: height *0.06),
                    Text("$tOptMessage  support@kingit.com" ,textAlign: TextAlign.center, ),
                    SizedBox(height: height *0.07),
                    OtpTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      numberOfFields: 6,
                      borderColor: Color(0xFF512DA8),
                      fillColor: Colors.black.withOpacity(0.1),
                      filled: true,
                      onSubmit: (code){
                        otp = code;
                        OTPController.instance.verifyOtp(otp);
                      },
                    ),
                    SizedBox(height: height *0.07),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          OTPController.instance.verifyOtp(otp);
                        },
                        child: Text("Next To"),
                      ),
                    )


                  ],
                ),
              ),
            ),
    );
  }
}
