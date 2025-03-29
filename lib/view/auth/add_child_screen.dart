import 'package:car_pooling/controller/auth_controller.dart';
import 'package:car_pooling/core/components/child_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/view/auth/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddChildScreen extends StatelessWidget {
  AddChildScreen({super.key});

  final AuthController controller = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Add a child".tr),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            // This column is responsible for rendering the added child cards
            spacing: 24.h,
            children: [
              Obx(() {
                return Column(
                  spacing: 4.h,
                  children:
                      controller.childList
                          .map((el) => ChildCard(el: el))
                          .toList(),
                );
              }),
              Form(
                // this form -> column is responsible for validating and taking child info
                key: _formKey,
                child: Column(
                  spacing: 16.h,
                  children: [
                    CustomInputField(
                      controller: controller.firstNameController,
                      hintText: "Child's first name".tr,
                    ),
                    CustomInputField(
                      controller: controller.lastNameController,
                      hintText: "child's last name".tr,
                    ),
                    CustomInputField(
                      controller: controller.schoolNameController,
                      hintText: "child's school name".tr,
                    ),
                    // add child data custom button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => controller.addChild(_formKey),
                          child: Row(
                            spacing: 4.w,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.primaryDark,
                                size: 18,
                              ),
                              Text(
                                "Add child".tr,
                                style: AppStyle.baseSmallRegular.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Custom button
                    CustomButton(
                      buttonTitle: "Next".tr,
                      onTap: () => Get.to(ForgotPasswordScreen(isReset: false)),
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
}
