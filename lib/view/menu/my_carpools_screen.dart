import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/carpool_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/model/carpool_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyCarpoolsScreen extends StatelessWidget {
  MyCarpoolsScreen({super.key});

  final MenuProfileController controller = Get.find<MenuProfileController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2,
      child: Scaffold(
        appBar: customAppBar1(
          AppLocalizations.of(context)!.myCarpools ,
          hasBack: true,
          hasTabBar: true,
          hasShadow: true,
          tabs: [
            Tab(text: AppLocalizations.of(context)!.upcoming ),
            Tab(text: AppLocalizations.of(context)!.asADriver ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TabBarView(
            children: [
              Obx(() => buildTabView(controller.myCarPoolHistory)),

              Obx(() => buildTabView(controller.myCarPoolHistory)),
            ],
           
          ),
        ),
      ),
    );
  }

  Widget buildTabView(List<CarpoolModel> carpool) {
    return carpool.isEmpty
        ? Center(child: Text(AppLocalizations.of(Get.context!)!.noDataYet ))
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
