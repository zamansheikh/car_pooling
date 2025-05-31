import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/carpool_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/model/carpool_model.dart';
import 'package:car_pooling/view/create_carpool/carpool_details_screen.dart';
import 'package:car_pooling/view/menu/local_component/upgrade_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../l10n/app_localizations.dart';

class MyCarpoolsScreen extends StatelessWidget {
  MyCarpoolsScreen({super.key});

  final MenuProfileController controller = Get.find<MenuProfileController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: customAppBar1(
          AppLocalizations.of(context)!.myCarpools,
          hasBack: true,
          hasTabBar: true,
          hasShadow: true,
          onTabSelect: (index) {
            if (index == 2) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return upgradeDialog(
                    onCancel: () {
                      
                    },
                  );
                },
              );
            }
          },
          tabs: [
            Tab(text: AppLocalizations.of(context)!.upcoming),
            Tab(text: AppLocalizations.of(context)!.asADriver),
            Tab(text: AppLocalizations.of(context)!.carpoolHistory),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TabBarView(
            children: [
              Obx(() => buildTabView(controller.myCarPoolHistory)),
              Obx(() => buildTabView(controller.myCarPoolHistory)),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabView(List<CarpoolModel> carpool) {
    return carpool.isEmpty
        ? Center(child: Text(AppLocalizations.of(Get.context!)!.noDataYet))
        : ListView.builder(
          itemCount: carpool.length,
          itemBuilder: (context, index) {
            final item = carpool[index];
            return CarpoolCard(
              type: CarpoolDetailsType.attending,
              canDrive: item.canDrive,
              date: item.date,
              eventName: item.eventName,
              fromLocation: item.fromLocation,
              image: item.image,
              startTime: item.startTime,
              estimatedEndTime: item.estimatedEndTime,
              toLocation: item.toLocation,
            );
          },
        );
  }
}
