import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/authentication/screen/singup_screen/singup.dart';

import '../../../../constants/image_constants/image.dart';
import '../../../../constants/text_constants/text.dart';
import 'package:get/get.dart';

import '../login_screen/login.dart';

class WelcomeScreenDesign extends StatelessWidget {
  const WelcomeScreenDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(tWelcomeImage),
            const Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.lightBlue),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  tWelcomeSubTitle,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.green),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child:
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              elevation:0,
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(fontSize: 18,),
                              side: const BorderSide(
                                color: Colors.green,
                                width: 3
                              )
                            ),
                            onPressed: () {
                              Get.to(const LoginScreen());
                            }, child: const Text('Login'))),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 18,),
                      ),
                        onPressed: () {
                        Get.to(SingUpScreen());
                        }, child: const Text('Singup'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
