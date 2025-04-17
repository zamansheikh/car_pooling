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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Add a listener to update an observable variable
    controller.startLocationController.addListener(() {
      controller.startLocationText.value =
          controller.startLocationController.text;
    });

    return Scaffold(
      appBar: customAppBar1("Create Carpool".tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Row(
                  spacing: 4.w,
                  children: [Text("What".tr, style: AppStyle.largeMedium)],
                ),
                SizedBox(height: 12.h),
                CustomInputField(
                  controller: controller.eventNameController,
                  hintText: "Event Name".tr,
                ),
                SizedBox(height: 24.h),
                // Where
                Text("Where".tr, style: AppStyle.largeMedium),
                SizedBox(height: 12.h),
                CustomInputField(
                  controller: controller.startLocationController,
                  hintText: "Start Location".tr,
                ),
                SizedBox(height: 12.h),
                CustomInputField(
                  controller: controller.endLocationController,
                  hintText: "End Location".tr,
                ),
                SizedBox(height: 12.h),

                Obx(() {
                  return controller.startLocationText.value.length > 3
                      ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Would you like to set this location as your home address?"
                                .tr,
                            style: AppStyle.baseSmallRegular.copyWith(
                              color: AppColors.gray,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              spacing: 24.w,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Okay".tr,
                                    style: AppStyle.baseRegular.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Later".tr,
                                    style: AppStyle.baseRegular.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                      : SizedBox.shrink();
                }),
                if (controller.startLocationText.value.length > 3)
                  SizedBox(height: 12.h),
                if (controller.startLocationText.value.length > 3)
                  SizedBox(height: 24.h),
                Text("When".tr, style: AppStyle.largeMedium),
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
                            buildOption("Does not repeat".tr),
                            buildOption("Daily".tr),
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
                    // This obx detects if custom, then it'll render extra ui
                    Obx(() {
                      if (controller.selectedOption.value != 'Custom') {
                        return SizedBox.shrink();
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Select Days".tr, style: AppStyle.baseMedium),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) {
                              final dayLabels = [
                                'S',
                                'M',
                                'T',
                                'W',
                                'T',
                                'F',
                                'S',
                              ];
                              final isSelected = controller.selectedDays
                                  .contains(index);

                              return GestureDetector(
                                onTap: () {
                                  if (isSelected) {
                                    controller.selectedDays.remove(index);
                                  } else {
                                    controller.selectedDays.add(index);
                                  }
                                },
                                child: Container(
                                  width: 40.w,
                                  height: 40.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? AppColors.primary
                                            : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    dayLabels[index],
                                    style: TextStyle(
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 16.h),
                          Text("Repeat Until".tr, style: AppStyle.baseMedium),
                          SizedBox(height: 8.h),
                          GestureDetector(
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                context: Get.context!,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                controller.customEndDate.value = picked;
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 14.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.calendar_today, size: 20),
                                  SizedBox(width: 8.w),
                                  Text(
                                    controller.customEndDate.value != null
                                        ? controller.customEndDate.value!
                                            .toLocal()
                                            .toString()
                                            .split(" ")[0]
                                        : "Select a date".tr,
                                    style: AppStyle.baseRegular,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
                // =========>>>>>>>> Create return trip <<<<<<<<<==========
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Create return trip'.tr,
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
                      child: Obx(() {
                        return CustomDateInput(
                          dateController: controller.returnDateController,
                          hintText: "${"Enter Return date".tr}...",
                          isEnabled: controller.isReturnTrip.value,
                        );
                      }),
                    ),
                    Flexible(
                      child: Obx(() {
                        return CustomTimeInput(
                          isEnabled: controller.isReturnTrip.value,
                          time: controller.timePicker.value,
                          onChange: (p0) {
                            controller.timePicker.value = p0;
                          },
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  buttonTitle: "Preview & Invites".tr,
                  isRounded: false,
                  onTap: () {
                    controller.previewAndInvites(_formKey);
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
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
              option.tr,
              style: AppStyle.baseMedium.copyWith(color: AppColors.darkGray),
            ),
          ],
        ),
      ),
    );
  }
}
