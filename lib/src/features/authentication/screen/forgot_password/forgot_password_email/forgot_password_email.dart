import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/image_constants/image.dart';
import '../forgot_password_otp/forgot_password_otp.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  const ForgotPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
         body: SingleChildScrollView(
           child: Container(
             width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            child: Column(
              children: [
                SizedBox(height: 70,),
                Container(
                  height: height *0.2,
                  child: Image.asset(forgotPassImage,),
                ),
                SizedBox(height: 30,),
                Text("Forget Password ",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black,fontWeight: FontWeight.w600),),
                Text("Select one of the options given below to reset your password.",style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: 30,),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "E- Mail",
                        labelStyle: TextStyle(color: Colors.black,fontSize: 18),
                        hintText: "E-Mail",
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 3),),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 3),),
                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){
                       Get.to(ForgotPasswordOtp());
                    }, child: Text("Next")),
                  ],
                ))
              ],
            ),
           ),
         ),
      ),
    );
  }
}
