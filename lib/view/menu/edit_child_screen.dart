import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/view/menu/local_component/profile_image_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../l10n/app_localizations.dart';

class EditChildScreen extends StatelessWidget {
  EditChildScreen({super.key, this.isSpouse  = false});

  final bool isSpouse;

  final MenuProfileController controller = Get.put(MenuProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(isSpouse? AppLocalizations.of(context)!.editSpouse : AppLocalizations.of(context)!.editChild),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15.h,
                  children: [
                    Obx(() {
                      return ProfileImageSelector(
                        radius: 40,
                        onImageSelect: controller.pickImage,
                        image: controller.profileImage.value,
                        myImageLink: "",
                      );
                    }),

                    CustomInputField(
                      controller: controller.firstNameController,
                      hintText: "First name",
                    ),
                    CustomInputField(
                      controller: controller.lastNameController,
                      hintText: "Last name",
                    ),
                    if(!isSpouse)
                    CustomInputField(
                      controller: controller.schoolNameController,
                      hintText: "School name",
                    ),
                    CustomButton(buttonTitle: AppLocalizations.of(context)!.save, onTap: () {}),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
