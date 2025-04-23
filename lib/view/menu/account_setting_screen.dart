import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/view/menu/local_compoent/section_container.dart';
import 'package:car_pooling/view/menu/local_compoent/toggle_options.dart';
import 'package:car_pooling/view/menu/package_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountSettingScreen extends StatelessWidget {
  AccountSettingScreen({super.key});

  final MenuProfileController controller = Get.put(MenuProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Account Settings" ),

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
                  title: 'Notification of Changes' ,
                  children: [
                    ToggleOption(
                      title: 'Changes to carpools I set up' ,
                      value: controller.carpoolChanges.value,
                      isLocked: controller.isLimitedAccess.value,
                      onChanged:
                          (value) => controller.carpoolChanges.value = value,
                    ),
                    ToggleOption(
                      title: 'Changes affecting my family' ,
                      value: controller.familyChanges.value,
                      isLocked: controller.isLimitedAccess.value,
                      onChanged:
                          (value) => controller.familyChanges.value = value,
                    ),
                    ToggleOption(
                      title: 'Changes affecting my driving' ,
                      value: controller.drivingChanges.value,
                      isLocked: controller.isLimitedAccess.value,
                      onChanged:
                          (value) => controller.drivingChanges.value = value,
                    ),
                  ],
                ),

                // Driving Reminders Section
                SectionContainer(
                  title: 'Driving Reminders' ,
                  children: [
                    ToggleOption(
                      title: '10 ${"minutes before" }',
                      value: controller.driving10Min.value,
                      onChanged:
                          (value) => controller.driving10Min.value = value,
                    ),
                    ToggleOption(
                      title: '1 ${"hour before" }',
                      value: controller.driving1Hour.value,
                      onChanged:
                          (value) => controller.driving1Hour.value = value,
                    ),
                    ToggleOption(
                      title: '24 ${"hours before" }',
                      value: controller.driving24Hours.value,
                      onChanged:
                          (value) => controller.driving24Hours.value = value,
                    ),
                  ],
                ),

                // Participation Reminders Section
                SectionContainer(
                  title: 'Participation Reminders' ,
                  children: [
                    ToggleOption(
                      title: '10 ${"minutes before" }',
                      value: controller.participation10Min.value,
                      onChanged:
                          (value) =>
                              controller.participation10Min.value = value,
                    ),
                    ToggleOption(
                      title: '1 ${"hour before" }',
                      value: controller.participation1Hour.value,
                      onChanged:
                          (value) =>
                              controller.participation1Hour.value = value,
                    ),
                    ToggleOption(
                      title: '24 ${"hours before" }',
                      value: controller.participation24Hours.value,
                      onChanged:
                          (value) =>
                              controller.participation24Hours.value = value,
                    ),
                  ],
                ),

                // Carpool Notes Notifications Section
                SectionContainer(
                  title: 'Carpool Notes Notifications' ,
                  children: [
                    ToggleOption(
                      title: 'Notify me of new messages' ,
                      value: controller.notifyNewMessages.value,
                      isLocked: controller.isLimitedAccess.value,
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
                      title: 'Child Pickup / Drop-off' ,
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
                  title: 'Preference' ,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Text(
                        'Receive notifications and invitations via:' ,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ToggleOption(
                      title: 'Email' ,
                      value: controller.emailNotifications.value,
                      onChanged:
                          (value) =>
                              controller.emailNotifications.value = value,
                    ),
                    ToggleOption(
                      title: 'Push' ,
                      value: controller.pushNotifications.value,
                      onChanged:
                          (value) => controller.pushNotifications.value = value,
                    ),
                  ],
                ),

                // Custom Button
                CustomButton(
                  buttonTitle: "Manage Subscription" ,
                  onTap: () {
                     Get.to(()=> PackageScreen(initialIndex: 1,));
                  },
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
