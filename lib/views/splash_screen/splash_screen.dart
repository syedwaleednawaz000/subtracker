import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/splash_provider.dart';
import 'package:sub_tracker/views/welcomeScreen/welcome_screen.dart';
import '../bottomnavbar/bottom_navBar.dart';
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
    Future.microtask(() => Provider.of<SplashProvider>(context,listen: false).checkLogin(context: context));
    Future.microtask(() => Provider.of<SplashProvider>(context,listen: false).initStateNetwork());
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
