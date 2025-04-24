import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/carpool_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_date_input.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/model/carpool_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarpoolHistoryScreen extends StatelessWidget {
  CarpoolHistoryScreen({super.key});
  final MenuProfileController controller = Get.find<MenuProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(AppLocalizations.of(context)!.carpoolHistory, hasBack: true, hasShadow: true),
      body:Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomDateInput(dateController: TextEditingController(), hintText: "Sort by date"),
              SizedBox(height: 6.h,),
              Text(AppLocalizations.of(context)!.youCanViewUpToThreeMonthsOfPastCarpoolEvents, style: AppStyle.smallRegular,),
              SizedBox(height: 12.h),
              Obx(() => Expanded(child: buildTabView(controller.myCarPoolHistory))),
            ],
          ),
        ),
      
    );
  }

  Widget buildTabView(List<CarpoolModel> carpool) {
    return carpool.isEmpty
        ? Center(child: Text(AppLocalizations.of(context)!.noDataYet))
        : ListView.builder(
          itemCount: carpool.length,
          itemBuilder: (context, index) {
            final item = carpool[index];
            return CarpoolCard(
              canDrive: item.canDrive,
              date: item.date,
              eventName: item.eventName,
              fromLocation: item.fromLocation,
              image: item.image,
              time: item.time,
              toLocation: item.toLocation,
            );
          },
        );
  }
}
