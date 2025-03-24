import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

AlertDialog customAlertDialog({
  title,
  content,
  asset,
  buttonText = "OK",
  route,
}) {
  return AlertDialog(
    icon: Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: SvgPicture.asset(asset),
    ),
    title: Text(
      "Password Changed",
      style: AppStyle.headerRegular3.copyWith(color: AppColors.primary),
    ),
    content: Text(
      "Your password has been changed successfully.",
      style: AppStyle.baseRegular.copyWith(color: AppColors.darkGray),
      textAlign: TextAlign.center,
    ),
    actions: [
      CustomButton(
        buttonTitle: "Ok",
        onTap: () {
          route();
        },
      ),
    ],
  );
}
