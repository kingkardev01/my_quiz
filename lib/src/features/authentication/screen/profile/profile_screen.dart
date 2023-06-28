import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/features/authentication/screen/login_screen/login.dart';
import 'package:quiz_app/src/features/authentication/screen/profile/update_profile_screen.dart';

import '../../../../constants/colours_constants/colors.dart';
import '../../../../constants/image_constants/image.dart';
import '../../../../constants/text_constants/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
            splashRadius: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // color: Colors.green,
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        onPressed: (){}, icon: Icon(LineAwesomeIcons.alternate_pencil,size: 20,),),
                    ),
                  )
                  
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name.toUpperCase(),
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              Text(
                email,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
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
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 25,
              ),
              ProfileMenuWidget(text: "Settings",icon: Icon(LineAwesomeIcons.cog,color: Colors.blue,),onPress: (){}, ),
              ProfileMenuWidget(text: "Billing Details",icon: Icon(LineAwesomeIcons.wallet,color: Colors.blue,),onPress: (){}, ),
              ProfileMenuWidget(text: "User Management",icon: Icon(LineAwesomeIcons.user_check,color: Colors.blue,),onPress: (){}, ),
              SizedBox(height: 20,),
              Divider(thickness: 1,),
              SizedBox(height: 20,),
              ProfileMenuWidget(text: "Information",icon: Icon(LineAwesomeIcons.info,color: Colors.blue,),onPress: (){}, ),
              ProfileMenuWidget(text: "Logout",icon: Icon(LineAwesomeIcons.alternate_sign_out,color: Colors.blue,),onPress: () async {
                await FirebaseAuth.instance.signOut();
                print("button is presed");
                Get.to(LoginScreen());
              },color: Colors.red,endIcon: false, ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key, required this.text, required this.icon, required this.onPress,  this.color = Colors.black , this.endIcon = true,
  });
  final String text;
  final Widget icon;
  final VoidCallback onPress;
  final Color color;
  final bool endIcon;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.5),
          ),
          child: icon,
        ),


        title: Text(text,style: TextStyle(color: color),),
        trailing: endIcon?  Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: IconButton(
            splashRadius: 20,
            onPressed: onPress,
            icon: Icon(LineAwesomeIcons.angle_right)
          ),
        ): null,


      ),
    );
  }
}
