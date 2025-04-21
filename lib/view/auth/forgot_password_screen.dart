import 'package:car_pooling/controller/auth_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/core/components/custom_phone_input.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key, required this.isReset});
  final AuthController controller = Get.find<AuthController>();
  final bool isReset;

  // to keep track of verification method
  final RxBool isPhone = true.obs;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(isReset ? "Reset password"  : "Verification" ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title for verification method
                Text(
                  isPhone.value
                      ? "Enter your mobile number" 
                      : "Enter your email" ,
                  style: AppStyle.headerMedium5.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
                SizedBox(height: 24.h),
                //input field based on the verification method
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      if (isPhone.value)
                        CustomPhoneInputField(
                          controller: controller.phoneController,
                        ),
                      if (!isPhone.value)
                        CustomInputField(
                          isEmail: true,
                          hintText: "example@email.com",
                          controller: controller.emailController,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                Obx(() {
                  return CustomButton(
                    buttonTitle: "Next" ,
                    isLoading: controller.isLoading.value,
                    onTap: () {
                      // OTP Request Function
                      controller.userGetOTP(
                        _formkey,
                        isPhone: isPhone.value,
                        isReset: isReset,
                      );
                    },
                  );
                }),
                SizedBox(height: 24.h),
                // Toggle the verification method between phone or email
                Center(
                  child: TextButton(
                    onPressed: () {
                      isPhone.value = !isPhone.value;
                    },
                    child: Text(
                      isPhone.value
                          ? "Verify with Email" 
                          : "Verify with Phone" ,
                      style: AppStyle.baseMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
