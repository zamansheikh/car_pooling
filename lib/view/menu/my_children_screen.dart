import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/child_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyChildrenScreen extends StatelessWidget {
  MyChildrenScreen({super.key});
  final MenuProfileController controller = Get.put(MenuProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("My Children".tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: ListView.builder(
          itemCount: controller.myChildrenList.length,

          itemBuilder: (context, index) {
            final child = controller.myChildrenList[index];
            return ChildCard(el: child);
          },
        ),
      ),
    );
  }
}
