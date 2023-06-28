import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/authentication/screen/splash_screen/splash_screen.dart';
import 'package:quiz_app/src/features/authentication/screen/welcome_design_screen/welcome_screen_design.dart';
import 'package:quiz_app/src/repository/authentication_repository/authentiocation_repository.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.zoom,
      transitionDuration: Duration(seconds: 3),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreenDesign(),
    );
  }
}
