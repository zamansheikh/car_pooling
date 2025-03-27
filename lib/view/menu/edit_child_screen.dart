import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/view/menu/local_compoent/profile_image_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditChildScreen extends StatelessWidget {
  EditChildScreen({super.key});

  final MenuProfileController controller = Get.put(MenuProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Edit Child"),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileImageSelector(
                radius: 40,
                onImageSelect: controller.pickImage,
                image: controller.profileImage.value,
                myImageLink: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
