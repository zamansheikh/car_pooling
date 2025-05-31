import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F3EC),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.only(top: 36.h),
                child: Center(
                  child: Image.asset("assets/common/logo.png", height: 88.h),
                ),
              ),
              Spacer(flex: 1),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.howItWorks,
                  style: AppStyle.headerRegular3.copyWith(
                    color: AppColors.primaryDark,
                    fontSize: 28.sp,
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              buildSteps(
                step: 1,
                body:
                    AppLocalizations.of(
                      context,
                    )!.createACarpoolBetweenTwoPoints,
              ),
              SizedBox(height: 16.h),
              buildSteps(
                step: 2,
                body:
                    AppLocalizations.of(
                      context,
                    )!.inviteYourFriendsToCarpoolWithYou,
              ),
              SizedBox(height: 16.h),
              buildSteps(
                step: 3,
                body:
                    AppLocalizations.of(
                      context,
                    )!.friendsJoinAndAddTheirChildSLocation,
              ),
              SizedBox(height: 16.h),
              buildSteps(
                step: 4,
                body:
                    AppLocalizations.of(
                      context,
                    )!.parentsVolunteerToDriveWeSendRemindersAndOptimizedRoutes,
              ),
              Spacer(flex: 2),
              CustomButton(
                buttonTitle: AppLocalizations.of(context)!.next,
                onTap: () => Get.toNamed(AppRoutes.welcomeScreen2),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSteps({step, body}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          "${"Step"} - 0$step",
          style: AppStyle.largeMedium.copyWith(color: AppColors.primaryDark),
        ),
        Text(
          body,
          style: AppStyle.baseMedium.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
