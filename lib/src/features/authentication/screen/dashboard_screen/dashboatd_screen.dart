import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/image_constants/image.dart';
import '../profile/profile_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();

}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 20));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome DashBoard",
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              splashRadius: 20,
              onPressed: (){
                Get.to(const ProfileScreen());
              },
              icon: Image.asset(pImage),
            ),
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}
