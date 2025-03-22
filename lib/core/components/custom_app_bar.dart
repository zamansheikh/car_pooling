import "package:car_pooling/core/constant/app_style.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

AppBar customAppBar1(title) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(Icons.chevron_left_sharp, size: 32.sp),
    ),
    title: Text(title, style: AppStyle.largeMedium),
  );
}
