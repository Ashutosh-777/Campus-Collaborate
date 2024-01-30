import 'package:campus_collaborate/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../models/user_info.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProfileScreen(
        userInfo: UserInfo(
            courses: ["Mathematics and Computing", "Course-2", "Course-3"],
            email: " ",
            name: "Manik Mehta",
            rollNumber: "220107052",
            skills: [6, 8, "Mechanical", 15, "Robotics", 17, "Shell"],
            url: ""),
      ),
    );
  }
}
