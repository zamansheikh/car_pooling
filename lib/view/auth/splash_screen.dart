import 'package:car_pooling/core/constant/app_assets.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.signIn);
    });
    return Scaffold(
      body: SafeArea(child: Center(child: Image.asset(AppAssets.appLogo))),
    );
  }
}
