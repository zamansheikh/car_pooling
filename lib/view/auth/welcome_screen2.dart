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
                "Welcome to HadiKid".tr,
                style: AppStyle.headerBold1.copyWith(fontSize: 40.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Text(
                "Let's get you started.".tr,
                style: AppStyle.baseRegular.copyWith(
                  color: AppColors.darkGray,
                  fontSize: 40.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(AppAssets.logoPng),
              ),
              Text(
                "Get started by inviting friends to join your carpool.".tr,
                style: AppStyle.baseRegular.copyWith(
                  color: AppColors.darkGray,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              CustomButton(
                buttonTitle: "Create Carpool".tr,
                onTap: () {
                  Get.toNamed(AppRoutes.createCarpool1);
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
