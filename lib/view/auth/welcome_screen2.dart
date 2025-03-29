import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_assets.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${"Welcome to HadiKid".tr}🎉",
                style: AppStyle.headerBold1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Text(
                "Let's get you started. No carpools yet! Get started by creating a carpool and sending invite."
                    .tr,
                style: AppStyle.baseRegular.copyWith(color: AppColors.darkGray),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48.h),
              Image.asset(AppAssets.appLogo),
              SizedBox(height: 48.h),
              CustomButton(
                buttonTitle: "Create Carpool".tr,
                onTap: () {
                  Get.toNamed(AppRoutes.createCarpool1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
