import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/features/authentication/screen/singup_screen/singup.dart';
import '../../../../constants/image_constants/image.dart';
import '../../../../constants/text_constants/text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValue = true;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                  logInTitle,
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
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        labelText: "E-mail",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: heightScreen * 0.02,
                    ),
                    TextFormField(
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
                    Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(context: context, builder: (context)=> Container(
                                color: Colors.yellow,
                                padding: EdgeInsets.all(30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(forgotPassTitle,style: Theme.of(context).textTheme.displaySmall,),
                                    Text(forgotPassSubTitle,style:Theme.of(context).textTheme.titleMedium ,),
                                    Container(
                                      height: 100,
                                      color: Colors.green,

                                    )
                                  ],
                                ),
                              ));
                            }, child: Text("Forget Password")))
                  ],
                )),
                //section-2 end

                //section-3 star
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("login".toUpperCase()),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("OR"),
                    const SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ),
                     height: 50,
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Image.asset("assets/images/icon.png",height: Get.height*0.04,),
                              SizedBox(width: 10,),
                              Text("Sign-in with Google",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                             // Image.asset(gIcon,height: Get.height*0.01,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                //section-3 end
                SizedBox(height: 30,),
                //section-4 star
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have An Account",style: TextStyle(fontSize: 18),),
                      TextButton(onPressed: (){
                        Get.to(SingUpScreen());
                      }, child: Text("SingUp",style: TextStyle(fontSize: 18),))
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
