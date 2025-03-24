import 'package:car_pooling/controller/carpooling_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_date_input.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/core/components/custom_time_input.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateCarpoolScreen2 extends StatelessWidget {
  CreateCarpoolScreen2({super.key});
  final CarpoolingController controller = Get.find<CarpoolingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Create Carpool"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Row(
                spacing: 4.w,
                children: [
                  Text("What", style: AppStyle.largeMedium),
                  Text(
                    "(Event Name)",
                    style: AppStyle.baseRegular.copyWith(color: AppColors.gray),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              CustomInputField(
                controller: controller.eventNameController,
                title: "Event Name",
              ),
              SizedBox(height: 24.h),
              // Where
              Text("Where", style: AppStyle.largeMedium),
              SizedBox(height: 12.h),
              CustomInputField(
                controller: controller.startLocationController,
                title: "Start Location",
              ),
              SizedBox(height: 12.h),
              CustomInputField(
                controller: controller.endLocationController,
                title: "End Location",
              ),
              SizedBox(height: 8.h),
              Text(
                "Would you like to set this location as your home address?",
                style: AppStyle.baseSmallRegular.copyWith(
                  color: AppColors.gray,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                spacing: 24.w,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Okay",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Later",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text("When", style: AppStyle.largeMedium),
              // ==========>>>>>>>>> repeat option selector <<<<<<<<=========
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // select one of 4 options
                  Row(
                    spacing: 58.w,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildOption("Does not repeat"),
                          buildOption("Daily"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildOption("Every week"),
                          buildOption("Custom"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () =>
                        controller.selectedOption.value == 'Custom'
                            ? Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text('S M T W T F S 01-Jun-24'),
                                  SizedBox(width: 8),
                                  Icon(Icons.edit, size: 20),
                                ],
                              ),
                            )
                            : SizedBox.shrink(),
                  ),
                ],
              ),
              // =========>>>>>>>> Create return trip <<<<<<<<<==========
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Create return trip',
                    style: TextStyle(
                      fontSize: 18.0,
                    ), // Adjust font size as needed
                  ),
                  Obx(() {
                    return Switch(
                      value: controller.isReturnTrip.value,
                      onChanged: (bool value) {
                        controller.isReturnTrip.value = value;
                      },
                      activeColor:
                          AppColors
                              .primary, // Color when the toggle is on (adjust as needed)
                    );
                  }),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                spacing: 16.w,
                children: [
                  Flexible(
                    child: CustomDateInput(
                      dateController: controller.returnDateController,
                      hintText: "Enter Return date...",
                    ),
                  ),
                  Flexible(
                    child: CustomTimeInput(
                      time: controller.timePicker.value,
                      onChange: (p0) {
                        controller.timePicker.value = p0;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              CustomButton(
                buttonTitle: "Preview & Invites",
                isRounded: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption(String option) {
    return InkWell(
      onTap: () {
        controller.selectedOption.value = option;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Obx(
              () => Radio(
                activeColor: AppColors.primary,
                value: option,
                groupValue: controller.selectedOption.value,
                onChanged: (String? value) {
                  controller.selectedOption.value = value!;
                },
              ),
            ),
            Text(
              option,
              style: AppStyle.baseMedium.copyWith(color: AppColors.darkGray),
            ),
          ],
        ),
      ),
    );
  }
}
