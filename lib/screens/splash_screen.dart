import 'package:campus_collaborate/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: NavBarScreen());
  }
}
