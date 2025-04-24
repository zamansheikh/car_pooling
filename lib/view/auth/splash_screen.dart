import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // TODO: Change to sign in screen
      Get.offAllNamed(AppRoutes.homeSCreen);
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(48.0),
          child: Center(child: Image.asset("assets/common/logo.png")),
        ),
      ),
    );
  }
}
