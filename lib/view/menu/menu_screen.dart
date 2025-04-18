import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/view/menu/local_compoent/menu_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Menu".tr, hasBack: false),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        children: [
          MenuOption(
            title: 'Carpools'.tr,
            icon: Icons.directions_car,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myCarpools);
            },
          ),
          MenuOption(
            title: 'Profile'.tr,
            icon: Icons.person_outline,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myProfiles);
            },
          ),
          MenuOption(
            title: 'Contact List'.tr,
            icon: Icons.contacts,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myContactList);
            },
          ),
          MenuOption(
            title: 'Account Setting'.tr,
            icon: Icons.settings,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.accountSetting);
            },
          ),
          MenuOption(
            title: 'Payment'.tr,
            icon: Icons.credit_card,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.payment);
            },
          ),
          MenuOption(
            title: 'Support'.tr,
            icon: Icons.support_agent,
            showChevron: true,
            onPress: () {},
          ),
          MenuOption(
            title: 'Privacy Policy'.tr,
            icon: Icons.privacy_tip,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.privacyPolicy);
            },
          ),
          MenuOption(
            title: 'Terms & Conditions'.tr,
            icon: Icons.description,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.termsCondition);
            },
          ),
          MenuOption(
            title: 'Language'.tr,
            icon: Icons.language,
            extra: Text(
              'English (US)',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            onPress: () {
              Get.toNamed(AppRoutes.language);
            },
          ),
          MenuOption(
            title: 'Share HadiKid with Friends'.tr,
            icon: Icons.share,
            showChevron: true,
            onPress: () {},
          ),
          MenuOption(
            title: 'Logout'.tr,
            icon: Icons.logout,
            showChevron: true,
            onPress: () {
              showModal(
                title: "Logout".tr,
                subtitle: "Are you sure you want to logout?".tr,
                buttonText: "Logout".tr,
                buttonAction: () {
                  Get.offAllNamed(AppRoutes.signIn);
                },
              );
            },
          ),
          MenuOption(
            title: 'Delete My Account'.tr,
            icon: Icons.delete,
            textColor: Colors.red,
            iconColor: Colors.red,
            onPress: () {
              showModal(
                title: "Delete Account".tr,
                subtitle: "Are you sure you want to delete your account?".tr,
                buttonText: "Delete".tr,
                buttonAction: () {
                  Get.offAllNamed(AppRoutes.signIn);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  showModal({title, subtitle, buttonText, buttonAction}) {
    showModalBottomSheet(
      context: Get.context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Modal takes only the space it needs
            children: [
              // Logout Title
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 16),
              // Confirmation Message
              Text(subtitle, style: TextStyle(fontSize: 16)),
              SizedBox(height: 24),
              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the modal
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'Cancel'.tr,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  // YES, LOGOUT Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: buttonAction,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal, // Match the button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
