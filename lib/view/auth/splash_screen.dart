import 'dart:io';

import 'package:car_pooling/core/constant/app_assets.dart';
import 'package:car_pooling/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

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
          padding: EdgeInsets.all(48.0),
          child: Center(
            child: VectorGraphic(
              height: 200,
              width: 200,
              loader: SvgFileLoader(File(AppAssets.logo)),
            ),
          ),
        ),
      ),
    );
  }
}
