import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sub_tracker/views/welcomeScreen/welcome_screen.dart';
import '../../bottom_nav/bottom_navBar.dart';
import '../../utils/app_Images.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.SplahBg), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
