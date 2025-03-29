import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/view/menu/local_compoent/section_container.dart';
import 'package:car_pooling/view/menu/local_compoent/toggle_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountSettingScreen extends StatelessWidget {
  AccountSettingScreen({super.key});

  final MenuProfileController controller = Get.put(MenuProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Account Settings".tr),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              spacing: 20.h,
              children: [
                SizedBox(),
                // Notification of Changes Section
                SectionContainer(
                  title: 'Notification of Changes'.tr,
                  children: [
                    ToggleOption(
                      title: 'Changes to carpools I set up'.tr,
                      value: controller.carpoolChanges.value,
                      isLocked: controller.isLimitedAccess.value,
                      onChanged:
                          (value) => controller.carpoolChanges.value = value,
                    ),
                    ToggleOption(
                      title: 'Changes affecting my family'.tr,
                      value: controller.familyChanges.value,
                      isLocked: controller.isLimitedAccess.value,
                      onChanged:
                          (value) => controller.familyChanges.value = value,
                    ),
                    ToggleOption(
                      title: 'Changes affecting my driving'.tr,
                      value: controller.drivingChanges.value,
                      isLocked: controller.isLimitedAccess.value,
                      onChanged:
                          (value) => controller.drivingChanges.value = value,
                    ),
                  ],
                ),

                // Driving Reminders Section
                SectionContainer(
                  title: 'Driving Reminders'.tr,
                  children: [
                    ToggleOption(
                      title: '10 ${"minutes before".tr}',
                      value: controller.driving10Min.value,
                      onChanged:
                          (value) => controller.driving10Min.value = value,
                    ),
                    ToggleOption(
                      title: '1 ${"hour before".tr}',
                      value: controller.driving1Hour.value,
                      onChanged:
                          (value) => controller.driving1Hour.value = value,
                    ),
                    ToggleOption(
                      title: '24 ${"hours before".tr}',
                      value: controller.driving24Hours.value,
                      onChanged:
                          (value) => controller.driving24Hours.value = value,
                    ),
                  ],
                ),

                // Participation Reminders Section
                SectionContainer(
                  title: 'Participation Reminders',
                  children: [
                    ToggleOption(
                      title: '10 ${"minutes before".tr}',
                      value: controller.participation10Min.value,
                      onChanged:
                          (value) =>
                              controller.participation10Min.value = value,
                    ),
                    ToggleOption(
                      title: '1 ${"hour before".tr}',
                      value: controller.participation1Hour.value,
                      onChanged:
                          (value) =>
                              controller.participation1Hour.value = value,
                    ),
                    ToggleOption(
                      title: '24 ${"hours before".tr}',
                      value: controller.participation24Hours.value,
                      onChanged:
                          (value) =>
                              controller.participation24Hours.value = value,
                    ),
                  ],
                ),

                // Carpool Notes Notifications Section
                SectionContainer(
                  title: 'Carpool Notes Notifications'.tr,
                  children: [
                    ToggleOption(
                      title: 'Notify me of new messages'.tr,
                      value: controller.notifyNewMessages.value,
                      onChanged:
                          (value) => controller.notifyNewMessages.value = value,
                    ),
                  ],
                ),

                // Live Tracking Section
                SectionContainer(
                  title: 'Live Tracking',
                  children: [
                    ToggleOption(
                      title: 'Child Pickup / Drop-off'.tr,
                      value: controller.childPickupDropoff.value,
                      isLocked: controller.isLimitedAccess.value,
                      onChanged:
                          (value) =>
                              controller.childPickupDropoff.value = value,
                    ),
                  ],
                ),

                // Preference Section
                SectionContainer(
                  title: 'Preference'.tr,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Text(
                        'Receive notifications and invitations via:'.tr,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ToggleOption(
                      title: 'Email'.tr,
                      value: controller.emailNotifications.value,
                      onChanged:
                          (value) =>
                              controller.emailNotifications.value = value,
                    ),
                    ToggleOption(
                      title: 'Push'.tr,
                      value: controller.pushNotifications.value,
                      onChanged:
                          (value) => controller.pushNotifications.value = value,
                    ),
                  ],
                ),

                // Custom Button
                CustomButton(
                  buttonTitle: "Manage Subscription".tr,
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
              ],
            );
          }),
        ),
      ),
    );
  }
}
