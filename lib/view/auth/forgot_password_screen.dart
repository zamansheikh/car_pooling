import 'package:car_pooling/controller/auth_controller.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_phone_input.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "Enter your mobile number",
                style: AppStyle.headerMedium5.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              SizedBox(height: 24.h),
            
              CustomPhoneInputField(controller: controller.phoneController  ),
              SizedBox(height: 40.h),
              CustomButton(buttonTitle: "Next", onTap: () {}),
              SizedBox(height: 40.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Verify with Email",
                  style: AppStyle.baseMedium.copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
