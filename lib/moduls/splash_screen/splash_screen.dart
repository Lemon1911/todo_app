import 'dart:async';

import 'package:flutter/material.dart';

import '../../layout/home_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "Splash_Screen";

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
      },
    );
    return Scaffold(
      body: Image(
        image: const AssetImage("assets/images/splash_background.png"),
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.fill,
      ),
    );
  }
}
