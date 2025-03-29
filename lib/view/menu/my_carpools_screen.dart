import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/carpool_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/model/carpool_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyCarpoolsScreen extends StatelessWidget {
  MyCarpoolsScreen({super.key});

  final MenuProfileController controller = Get.find<MenuProfileController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: customAppBar1(
          "My Carpools".tr,
          hasBack: true,
          hasTabBar: true,
          hasShadow: true,
          tabs: [
            Tab(text: "Upcoming".tr),
            Tab(text: "History".tr),
            Tab(text: "As a Driver".tr),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TabBarView(
            children: [
              buildTabView(controller.myCarPoolHistory),
              buildTabView(controller.myCarPoolHistory),
              buildTabView(controller.myCarPoolHistory),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabView(List<CarpoolModel> carpool) {
    return carpool.isEmpty
        ? Center(child: Text('No data yet'.tr))
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
