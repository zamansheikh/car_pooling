import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 32.h,
                  bottom: 48.h,
                  left: 20.w,
                  right: 20.w,
                ),
                width: Get.width,
                decoration: BoxDecoration(color: AppColors.white),

                child: Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How to Works".tr,
                      style: AppStyle.headerRegular3.copyWith(
                        color: AppColors.primary,
                      ),
                    ),

                    buildSteps(
                      step: 1,
                      body: "Create a carpool between two points.".tr,
                    ),
                    buildSteps(
                      step: 2,
                      body: "Invite your friends to carpool with you.".tr,
                    ),
                    buildSteps(
                      step: 3,
                      body: "Friends join and add their child's location.".tr,
                    ),
                    buildSteps(
                      step: 4,
                      body:
                          "Parents Volunteer to Drive. We Send reminders and optimized routes."
                              .tr,
                    ),
                    CustomButton(
                      buttonTitle: "Next".tr,
                      onTap: () => Get.toNamed(AppRoutes.welcomeScreen2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSteps({step, body}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          "${"Step".tr} - 0$step",
          style: AppStyle.largeMedium.copyWith(color: AppColors.primaryDark),
        ),
        Text(
          body,
          style: AppStyle.baseMedium.copyWith(color: AppColors.primaryDark),
        ),
      ],
    );
  }
}
