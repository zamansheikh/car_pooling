import 'package:car_pooling/controller/auth_controller.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.isReset, required this.sendTo});
  final bool isReset;
  // This variable only shows which number/email the otp has been sent to
  final String sendTo;

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: ListView(
            reverse: true,
            children: [
              Column(
                children: [
                  Text(
                    "OTP reset code has been sent to $sendTo \n Please enter the code below",
                    style: AppStyle.baseRegular.copyWith(
                      color: AppColors.darkGray,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 24.h),
                  Pinput(
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => controller.otpController.text = pin,
                  ),
                  SizedBox(height: 24.h),

                  Obx(
                    () => Container(
                      child:
                          controller.isTimerActive.value
                              ? Text(
                                "Times remaining: 00:${controller.secondsRemaining} s",
                                style: AppStyle.baseSmallRegular.copyWith(
                                  color: AppColors.gray,
                                ),
                              )
                              : TextButton(
                                onPressed: () {
                                  controller.resendOTP(sendTo);
                                },
                                child: Text(
                                  "resend",
                                  style: AppStyle.baseSmallMedium.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Obx(() {
                    return CustomButton(
                      buttonTitle: "Next",
                      isLoading: controller.isLoading.value,
                      onTap: () {
                        controller.confirmOTP(isReset: isReset, sendTo: sendTo);
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
