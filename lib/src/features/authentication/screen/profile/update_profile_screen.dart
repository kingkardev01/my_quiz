import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../constants/colours_constants/colors.dart';
import '../../../../constants/image_constants/image.dart';
import '../../../../constants/text_constants/text.dart';
import '../../controllers/sing_up_controller/singup_controller.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool isValue = true;

  final controller = Get.put(SingUpController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 40),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(mpImage),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),color: tPrimaryColor,
                      ),
                      child: IconButton(
                        splashRadius: 20.0,
                        onPressed: (){}, icon: Icon(LineAwesomeIcons.camera,size: 20,),),
                    ),
                  )

                ],
              ),
              SizedBox(height: 40,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.fullName,
                      // focusNode: f1,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                        ),
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
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30.0))
                        ),
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
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30.0))
                        ),
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
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          prefixIcon: Icon(Icons.password),
                          hintText: "Password",
                          labelText: "Password",
                          suffix: InkWell(
                            onTap: passwordVisiable,
                            child: Icon(Icons.remove_red_eye),
                          )),
                      obscureText: isValue,
                    ),
                    SizedBox(height: 30,),
                    SizedBox(
                      // width: 300,
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          Get.to(UpdateProfileScreen());
                        },
                        child: Text(
                          edit,
                          style: TextStyle(color: tDarkColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    const Row(
                      children: [
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: "Joined 27 June 2022"
                            )
                          ]
                        ))
                      ],
                    )

                  ],
                ),
              ),
            ],
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
