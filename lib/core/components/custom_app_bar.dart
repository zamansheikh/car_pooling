import "package:car_pooling/core/constant/app_style.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

AppBar customAppBar1(title, {hasBack = true}) {
  return AppBar(
    leading:
        hasBack
            ? GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.chevron_left_sharp, size: 32.sp),
            )
            : Container(),
    title: Text(title, style: AppStyle.largeMedium),
  );
}
