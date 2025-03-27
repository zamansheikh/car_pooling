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
      appBar: customAppBar1("menu", hasBack: false),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        children: [
          MenuOption(
            title: 'My Carpools',
            icon: Icons.directions_car,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myCarpools);
            },
          ),
          MenuOption(
            title: 'My Profile',
            icon: Icons.person_outline,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myProfiles);
            },
          ),
          MenuOption(
            title: 'My Contact List',
            icon: Icons.contacts,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myContactList);
            },
          ),
          MenuOption(
            title: 'Account Setting',
            icon: Icons.settings,
            showChevron: true,
            onPress: () {
              print('Account Setting pressed');
            },
          ),
          MenuOption(
            title: 'Payment',
            icon: Icons.credit_card,
            showChevron: true,
            onPress: () {
              print('Payment pressed');
            },
          ),
          MenuOption(
            title: 'Support',
            icon: Icons.support_agent,
            showChevron: true,
            onPress: () {
              print('Support pressed');
            },
          ),
          MenuOption(
            title: 'Privacy Policy',
            icon: Icons.privacy_tip,
            showChevron: true,
            onPress: () {
              print('Privacy Policy pressed');
            },
          ),
          MenuOption(
            title: 'Terms & Conditions',
            icon: Icons.description,
            showChevron: true,
            onPress: () {
              print('Terms & Conditions pressed');
            },
          ),
          MenuOption(
            title: 'Language',
            icon: Icons.language,
            extra: Text(
              'English (US)',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            onPress: () {
              print('Language pressed');
            },
          ),
          MenuOption(
            title: 'Share HadiKid with Friends',
            icon: Icons.share,
            showChevron: true,
            onPress: () {
              print('Share HadiKid with Friends pressed');
            },
          ),
          MenuOption(
            title: 'Logout',
            icon: Icons.logout,
            showChevron: true,
            onPress: () {
              print('Logout pressed');
            },
          ),
          MenuOption(
            title: 'Delete My Account',
            icon: Icons.delete,
            textColor: Colors.red,
            iconColor: Colors.red,
            onPress: () {
              print('Delete My Account pressed');
            },
          ),
        ],
      ),
    );
  }
}
