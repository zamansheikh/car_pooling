import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/core/components/custom_phone_input.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
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
                  SizedBox(height: 10.h),
                  Text("Daniel Austin", style: AppStyle.headerBold3),
                  SizedBox(height: 4.h),
                  Text(
                    "daniel_austin@yourdomain.com",
                    style: AppStyle.baseSmallMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 50.h),

            Column(
              spacing: 16.h,
              children: [
                CustomInputField(
                  controller: controller.nameController,
                  hintText: "Daniel Austin",
                ),

                CustomInputField(
                  controller: controller.emailController,
                  hintText: "daniel_austin@yourdomain.com",
                ),

                CustomPhoneInputField(controller: controller.phoneController),
                // TODO: Continue working in this page
                homeAddressSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container homeAddressSection() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side: Title and Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Home Address", style: AppStyle.headerBold5),
                SizedBox(height: 4.h),
                Text(
                  "Your home address will allow you to send or receive ‘Add Contact’ requests to connect with HadiKid families nearby.",
                  style: AppStyle.smallRegular.copyWith(
                    color: Colors.grey[600], // Gray color for description
                  ),
                ),
              ],
            ),
          ),
          // Right side: Toggle Switch
          Obx(() {
            return Switch(
              value: controller.homeAddressVisible.value,
              onChanged: (value) {
                controller.homeAddressVisible.value = value;
              },
            );
          }),
        ],
      ),
    );
  }
}
