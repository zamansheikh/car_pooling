import 'package:car_pooling/core/constant/app_assets.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2), () {
    //   Get.offAllNamed(AppRoutes.signIn);
    // });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Center(child: svgViewer(asset: AppAssets.logo)),
        ),
      ),
    );
  }
}
