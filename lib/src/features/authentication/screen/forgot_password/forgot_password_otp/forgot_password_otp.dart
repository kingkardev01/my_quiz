import 'package:flutter/material.dart';

class ForgotPasswordOtp extends StatelessWidget {
  const ForgotPasswordOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: height *0.2,),
                    Container(
                      child: Text("Quiz App",style: Theme.of(context).textTheme.headlineLarge,),
                    ),
                    Text("Verification")
                  ],
                ),
              ),
            ),
    );
  }
}
