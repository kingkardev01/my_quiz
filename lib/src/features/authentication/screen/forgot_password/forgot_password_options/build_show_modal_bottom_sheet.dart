import 'package:flutter/material.dart';

import '../../../../../constants/text_constants/text.dart';
import '../forgot_password_email/forgot_password_email.dart';
import 'forgot_pass_btn_widget.dart';
import 'package:get/get.dart';

Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      builder: (context)=> Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0)),
          // color: Colors.yellow,
        ),
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(forgotPassTitle,style: Theme.of(context).textTheme.titleLarge,),
            Text(forgotPassSubTitle,style:Theme.of(context).textTheme.titleMedium ,),
            const SizedBox(height: 20,),
            ForgotPassBtnWidget(icon: Icons.email_rounded, textTitle1: 'E-mail', textTitle2: 'Reset via Mail Verifaction', onTap: () {
              Navigator.pop(context);
              Get.to(ForgotPasswordEmailScreen());
            },),
            const SizedBox(height: 15,),
            ForgotPassBtnWidget(icon: Icons.phone_android_outlined, textTitle1: 'Phone', textTitle2: 'Reset via Phone Verifaction', onTap: () {  },),
          ],
        ),
      ));
}