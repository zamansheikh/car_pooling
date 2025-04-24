import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/view/menu/local_compoent/menu_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyPorfileScreen extends StatelessWidget {
  const MyPorfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(AppLocalizations.of(context)!.profile ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          children: [
            MenuOption(
              title: AppLocalizations.of(context)!.myInformation ,
              icon: Icons.person_outline,
              onPress: () {
                Get.toNamed(AppRoutes.myInformation);
              },
            ),
            MenuOption(
              title: AppLocalizations.of(context)!.myFamilyMembers ,
              icon: Icons.person_outline,
              onPress: () {
                Get.toNamed(AppRoutes.myChildren);
              },
            ),
          ],
        ),
      ),
    );
  }
}
