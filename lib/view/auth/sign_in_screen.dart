import 'package:car_pooling/controller/auth_controller.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: ListView(
            // The child inside the listview are layed out bottom to top
            reverse: true,
            children: [
              // =================>>>>>>>>>>>>> goto sign up <<<<<<<<<<<<<===============
              Row(
                spacing: 4.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppStyle.smallRegular.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Sign Up",
                      style: AppStyle.smallMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    // =================>>>>>>>>>>>>> Text Controller <<<<<<<<<<<<<===============
                    CustomInputField(
                      controller: controller.emailController,
                      title: "Email",
                    ),
                    SizedBox(height: 16.h),
                    CustomInputField(
                      controller: controller.passwordController,
                      title: "Password",
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
                              "Remember Me",
                              style: AppStyle.smallMedium.copyWith(
                                color: AppColors.gray,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          child: Text(
                            "Forget Password?",
                            style: AppStyle.smallMedium.copyWith(
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
                        buttonTitle: "Sign In",
                        onTap: controller.userSignIn,
                        isLoading: controller.isLoading.value,
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(height: 24.h),
              Text("Sign In Your Account", style: AppStyle.headerBold1),
            ],
          ),
        ),
      ),
    );
  }
}
