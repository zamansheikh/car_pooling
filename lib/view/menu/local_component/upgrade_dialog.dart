import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AlertDialog upgradeDialog({Function()? onCancel}) {
  return AlertDialog(
    backgroundColor: AppColors.white,
    title: Padding(
      padding: EdgeInsets.only(top: 18.h),
      child: Text(
        "Upgrade to HadiKid Premium!",
        style: AppStyle.headerBold3.copyWith(fontSize: 21.sp),
        textAlign: TextAlign.center,
      ),
    ),
    content: Text(
      "Enjoy exclusive features with 7 days FREE — no strings attached! Ready to upgrade?",
      style: AppStyle.baseRegular.copyWith(color: Color(0xff424242)),
      textAlign: TextAlign.center,
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12.w,
        children: [
          SizedBox(
            width: Get.width * 0.31,
            child: CustomButton(
              buttonTitle: "Learn More",
              isFilled: true,
              onTap: () {
                Get.toNamed(AppRoutes.packages);
              },
            ),
          ),
          SizedBox(
            width: Get.width * 0.31,
            child: CustomButton(
              buttonTitle: "Not Now",
              isFilled: true,
              isRed: true,
              onTap: () {
                onCancel?.call();
                Get.back();
              },
            ),
          ),
        ],
      ),
    ],
  );
}
