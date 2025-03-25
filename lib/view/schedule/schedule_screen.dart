import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

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
      ),
    );
  }
}
