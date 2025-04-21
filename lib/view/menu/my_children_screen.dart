import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/child_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/spouse_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyChildrenScreen extends StatelessWidget {
  MyChildrenScreen({super.key});

  // Use Get.put only if this screen is responsible for creating the controller instance
  // If the controller is created elsewhere (e.g., in main or a binding), use Get.find()
  final MenuProfileController controller = Get.put(MenuProfileController());

  @override
  Widget build(BuildContext context) {
    // Wrap the Scaffold with DefaultTabController
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: customAppBar1(
          "My Family Members" ,
          hasTabBar: true, // Ensure this tells customAppBar1 to add a TabBar
          tabs: [
            Tab(text: "Children" ), // First tab
            Tab(text: "Spouse" ), // Second tab
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          // TabBarView needs children corresponding to the tabs in order
          child: TabBarView(
            children: [
              // Content for the FIRST tab ("Children")
              Obx(() {
                // Display message if the list is empty
                if (controller.myChildrenList.isEmpty) {
                  return Center(child: Text("No children added yet." ));
                }
                // Build the list if not empty
                return ListView.builder(
                  itemCount: controller.myChildrenList.length,
                  itemBuilder: (context, index) {
                    // Prevent index out of bounds if list is modified concurrently
                    if (index >= controller.myChildrenList.length) {
                      return const SizedBox.shrink();
                    }
                    final child = controller.myChildrenList[index];
                    return ChildCard(
                      el: child,
                      onTapDelete: () {
                        // Consider adding confirmation dialog before deleting
                        controller.myChildrenList.removeAt(index);
                      },
                    );
                  },
                );
              }),

              // Content for the SECOND tab ("Spouse")
              Obx(() {
                // Display message if the list is empty
                if (controller.myChildrenList.isEmpty) {
                  return Center(child: Text("No children added yet." ));
                }
                // Build the list if not empty
                return ListView.builder(
                  itemCount: controller.mySpouseList.length,
                  itemBuilder: (context, index) {
                    // Prevent index out of bounds if list is modified concurrently
                    if (index >= controller.mySpouseList.length) {
                      return const SizedBox.shrink();
                    }
                    final spouse = controller.mySpouseList[index];
                    return SpouseCard(
                      el: spouse,
                      onTapDelete: () {
                        // Consider adding confirmation dialog before deleting
                        controller.mySpouseList.removeAt(index);
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
