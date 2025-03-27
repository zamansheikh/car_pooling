import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/view/menu/local_compoent/profile_image_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyInformationScreen extends StatelessWidget {
  MyInformationScreen({super.key});

  final MenuProfileController controller = Get.put(MenuProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("My Information"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Obx(() {
                    return ProfileImageSelector(
                      radius: 70,
                      onImageSelect: controller.pickImage,
                      myImageLink: "",
                      image: controller.profileImage.value,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
