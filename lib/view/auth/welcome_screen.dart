import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 32.h,
                  bottom: 48.h,
                  left: 20.w,
                  right: 20.w,
                ),
                width: Get.width,
                decoration: BoxDecoration(color: AppColors.white),

                child: Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Image.asset("assets/common/logo.png"),
                    SizedBox(height: 64.h),
                    Text(
                      AppLocalizations.of(context)!.howItWorks ,
                      style: AppStyle.headerRegular3.copyWith(
                        color: AppColors.primaryDark,
                        fontSize: 28.sp
                      ),
                    ),

                    buildSteps(
                      step: 1,
                      body: AppLocalizations.of(context)!.createACarpoolBetweenTwoPoints ,
                    ),
                    buildSteps(
                      step: 2,
                      body: AppLocalizations.of(context)!.inviteYourFriendsToCarpoolWithYou ,
                    ),
                    buildSteps(
                      step: 3,
                      body: AppLocalizations.of(context)!.friendsJoinAndAddTheirChildSLocation ,
                    ),
                    buildSteps(
                      step: 4,
                      body:
                          AppLocalizations.of(context)!.parentsVolunteerToDriveWeSendRemindersAndOptimizedRoutes
                               ,
                    ),
                    CustomButton(
                      buttonTitle: AppLocalizations.of(context)!.next ,
                      onTap: () => Get.toNamed(AppRoutes.welcomeScreen2),
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

  Column buildSteps({step, body}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          "${"Step" } - 0$step",
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
