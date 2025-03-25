import 'package:car_pooling/core/components/custom_bottom_navigation_bar.dart';
import 'package:car_pooling/view/create_carpool/create_carpool_screen1.dart';
import 'package:car_pooling/view/find_families/find_family_screen.dart';
import 'package:car_pooling/view/inbox/inbox_screen.dart';
import 'package:car_pooling/view/menu/menu_screen.dart';
import 'package:car_pooling/view/schedule/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController controller = PageController();

  final RxInt _index = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          _index.value = value;
        },
        children: [
          FindFamilyScreen(),
          ScheduleScreen(),
          CreateCarpoolScreen1(),
          InboxScreen(),
          MenuScreen(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return CustomBottomNavigationBar(
          menuIndex: _index.value,
          onChanged: (index) {
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
            );
          },
        );
      }),
    );
  }
}
