import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AlertDialog upgradeDialog() {
  return AlertDialog(
    backgroundColor: AppColors.white,
    title: Text("Upgrade to HadiKid Premium!".tr, style: AppStyle.headerBold3),
    content: Text(
      "Enjoy exclusive features with 7 days FREE — no strings attached! Ready to upgrade?".tr,
      style: AppStyle.baseRegular.copyWith(color: Color(0xff424242)),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12.w,
        children: [
          SizedBox(
            width: Get.width * 0.31,
            child: CustomButton(
              buttonTitle: "Not Now".tr,
              isFilled: false,
              onTap: () {
                Get.back();
              },
            ),
          ),
          SizedBox(
            width: Get.width * 0.31,
            child: CustomButton(
              buttonTitle: "Learn More".tr,
              isFilled: false,
              onTap: () {
                Get.toNamed(AppRoutes.packages);
              },
            ),
          ),
        ],
      ),
    ],
  );
}
