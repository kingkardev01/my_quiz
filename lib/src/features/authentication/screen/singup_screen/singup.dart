import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/features/authentication/controllers/sing_up_controller/singup_controller.dart';
import 'package:quiz_app/src/features/authentication/screen/login_screen/login.dart';
import '../../../../constants/image_constants/image.dart';
import '../../../../constants/text_constants/text.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  bool isValue = true;

  final controller = Get.put(SingUpController());

  final _formKey = GlobalKey<FormState>();

  // FocusNode f1 = FocusNode();
  // FocusNode f2 = FocusNode();
  // FocusNode f3 = FocusNode();
  // FocusNode f4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //section-1 star
                Image.asset(
                  tLoginImage,
                  height: Get.height * 0.2,
                ),
                Text(
                  singUpTitle,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: Colors.black),
                ),
                Text(
                  logInSubTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                //section-1 end
                SizedBox(
                  height: heightScreen * 0.02,
                ),
                //section-2 star
                Form(
                  key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.fullName,
                          // focusNode: f1,
                          decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.account_box_rounded),
                            hintText: "FullName",
                            labelText: "Full Name",
                          ),
                          // onChanged: (String newVal) {
                          //   if (newVal.length == 1) {
                          //     f1.unfocus();
                          //     FocusScope.of(context).requestFocus(f2);
                          //   }
                          // },
                        ),
                        SizedBox(
                          height: heightScreen * 0.02,
                        ),
                        TextFormField(
                          controller: controller.email,
                          // focusNode: f2,
                          decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email",
                            labelText: "E-mail",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          // onChanged: (String newVal) {
                          //   if (newVal.length == 1) {
                          //     f2.unfocus();
                          //     FocusScope.of(context).requestFocus(f3);
                          //   }
                          // },
                        ),
                        SizedBox(
                          height: heightScreen * 0.02,
                        ),
                        TextFormField(
                          controller: controller.phoneNo,
                          // focusNode: f3,
                          decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone),
                            hintText: "Phone",
                            labelText: "Phone",
                          ),
                          // onChanged: (String newVal) {
                          //   if (newVal.length == 1) {
                          //     f3.unfocus();
                          //     FocusScope.of(context).requestFocus(f4);
                          //   }
                          // },
                        ),
                        SizedBox(
                          height: heightScreen * 0.02,
                        ),
                        TextFormField(
                          controller: controller.password,
                          // focusNode: f4,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.password),
                              hintText: "Password",
                              labelText: "Password",
                              suffix: InkWell(
                                onTap: passwordVisiable,
                                child: Icon(Icons.remove_red_eye),
                              )),
                          obscureText: isValue,
                        ),

                      ],
                    ),
                ),
                //section-2 end
                SizedBox(
                  height: heightScreen * 0.02,
                ),
                //section-3 star
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: heightScreen * 0.06,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            SingUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                            print(controller.email.text);
                            print(controller.password.text);


                          }
                        },
                        child: Text("SingUp".toUpperCase()),
                      ),
                    ),
                    SizedBox(height: heightScreen * 0.01,),
                    const Text("OR"),
                    SizedBox(height: heightScreen * 0.01,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ),
                      height: heightScreen * 0.06,
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icon.png",height: Get.height*0.04,),
                            SizedBox(width: widthScreen *0.03,),
                            Text("Sign-in with Google",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                            // Image.asset(gIcon,height: Get.height*0.01,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                //section-3 end
                SizedBox(height: heightScreen*0.02,),
                //section-4 star
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account",style: TextStyle(fontSize: 18),),
                      TextButton(onPressed: (){
                        Get.to(LoginScreen());
                      }, child: Text("LogIn",style: TextStyle(fontSize: 18),))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void passwordVisiable() {
    setState(() {
      isValue = !isValue;
    });
    // FocusScope.of(context).requestFocus(new FocusNode());
  }
}
