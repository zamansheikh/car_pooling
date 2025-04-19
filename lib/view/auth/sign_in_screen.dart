import 'package:car_pooling/controller/auth_controller.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/view/auth/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final AuthController controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          // The list view is used to shift the layout at the bottom and enable scrolling behaviour
          child: ListView(
            // reverse is used to shift the layout at the bottom
            reverse: false,
            children: [
              // Extra column taken, so that we dont have to lay the widgets in oppostite order
              Column(
                children: [
                  SizedBox(height: 72.h),
                  Text(
                    "Sign In Your Account".tr,
                    style: AppStyle.headerBold2.copyWith(
                      fontSize: 32.sp,
                      color: Color(0xFF67c28d),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // =================>>>>>>>>>>>>> Text Controller <<<<<<<<<<<<<===============
                        CustomInputField(
                          controller: controller.emailController,
                          hintText: "Email".tr,
                        ),
                        SizedBox(height: 16.h),
                        CustomInputField(
                          controller: controller.passwordController,
                          isPassword: true,
                          hintText: "Password".tr,
                        ),
                        // =================>>>>>>>>>>>>> Row - check, forgot <<<<<<<<<<<<<===============
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(() {
                                  return Checkbox(
                                    value: controller.checkBoxStatus.value,
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.checkBoxStatus.value = value;
                                      }
                                    },
                                  );
                                }),
                                Text(
                                  "Remember me".tr,
                                  style: AppStyle.baseSmallMedium.copyWith(
                                    color: AppColors.gray,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.clearControllers();
                                Get.to(ForgotPasswordScreen(isReset: true));
                              },
                              child: Text(
                                "Forgot password?".tr,
                                style: AppStyle.baseSmallMedium.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        // =================>>>>>>>>>>>>> SignInButton <<<<<<<<<<<<<===============
                        Obx(() {
                          return CustomButton(
                            buttonTitle: "Sign In".tr,
                            onTap: () {
                              controller.userSignIn(_formKey);
                            },
                            isLoading: controller.isLoading.value,
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // =================>>>>>>>>>>>>> goto sign up <<<<<<<<<<<<<===============
                  Row(
                    spacing: 4.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?".tr,
                        style: AppStyle.smallRegular.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.signUp);
                        },
                        child: Text(
                          "Sign Up".tr,
                          style: AppStyle.smallMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
