import 'package:car_pooling/controller/schedule_controller.dart';
import 'package:car_pooling/core/components/carpool_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/model/carpool_model.dart';
import 'package:car_pooling/view/auth/welcome_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});
  final ScheduleController controller = Get.find<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // DefaultTabController is needed to use tabbar with appbar
      length: 2,
      child: Scaffold(
        appBar: customAppBar1(
          "Schedule",
          hasBack: false,
          hasTabBar: true,
          tabs: [Tab(text: "Attending"), Tab(text: "Driving")],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TabBarView(
            children: [
              buildTabView(controller.carpoolList),
              buildTabView(controller.carpoolList),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabView(List<CarpoolModel> carpools) {
    return carpools.isEmpty
        ? WelcomeScreen2()
        : ListView.builder(
          itemCount: carpools.length,
          itemBuilder: (context, index) {
            final item = carpools[index];
            return CarpoolCard(
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
