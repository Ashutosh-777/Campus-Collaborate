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
            courses: [],
            email: " ",
            name: "",
            rollNumber: "",
            skills: [""],
            url: ""),
      ),
    );
  }
}
