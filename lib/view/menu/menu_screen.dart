import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/view/menu/local_compoent/menu_option.dart';
import 'package:car_pooling/view/menu/local_compoent/upgrade_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(AppLocalizations.of(context)!.menu, hasBack: false),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        children: [
          MenuOption(
            title: AppLocalizations.of(context)!.carpools,
            icon: Icons.directions_car,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myCarpools);
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.carpoolHistory,
            icon: Icons.directions_car,
            isPremium: true,
            showChevron: true,
            onPress: () {
              showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return upgradeDialog();
                    },
                  );
              // Get.toNamed(AppRoutes.carpoolHistory);
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.profile,
            icon: Icons.person_outline,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myProfiles);
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.contactList,
            icon: Icons.contacts,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.myContactList);
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.accountSetting,
            icon: Icons.settings,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.accountSetting);
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.payment,
            icon: Icons.credit_card,
            showChevron: true,
            onPress: () {
              Get.toNamed(AppRoutes.payment);
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.support,
            icon: Icons.support_agent,
            showChevron: true,
            onPress: () async {
              final Uri url = Uri.parse('https://hadikid.com/destek.html');
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                debugPrint('Could not launch $url');
                // You might want to show a message to the user
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Could not open support page')),
                // );
              }
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.privacyPolicy,
            icon: Icons.privacy_tip,
            showChevron: true,
            onPress: () async {
              final Uri url = Uri.parse(
                'https://hadikid.com/gizlilik-politikasi.html',
              );
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                debugPrint('Could not launch $url');
                // You might want to show a message to the user
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Could not open support page')),
                // );
              }
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.termsConditions,
            icon: Icons.description,
            showChevron: true,
            onPress: () async {
              final Uri url = Uri.parse(
                'https://hadikid.com/hizmet-sartlari.html',
              );
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                debugPrint('Could not launch $url');
                // You might want to show a message to the user
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Could not open support page')),
                // );
              }
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.language,
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
            title: AppLocalizations.of(context)!.shareHadikidWithFriends,
            icon: Icons.share,
            showChevron: true,
            onPress: () async {
             await SharePlus.instance.share(
                ShareParams(text: "Check out HadiKid! https://hadikid.com/"),
              );
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.logout,
            icon: Icons.logout,
            showChevron: true,
            onPress: () {
              showModal(
                title: AppLocalizations.of(context)!.logout,
                subtitle: AppLocalizations.of(context)!.areYouSureYouWantToLogout,
                buttonText: AppLocalizations.of(context)!.logout,
                buttonAction: () {
                  Get.offAllNamed(AppRoutes.signIn);
                },
              );
            },
          ),
          MenuOption(
            title: AppLocalizations.of(context)!.deleteMyAccount,
            icon: Icons.delete,
            textColor: Colors.red,
            iconColor: Colors.red,
            onPress: () {
              showModal(
                title: AppLocalizations.of(context)!.deleteAccount,
                subtitle: AppLocalizations.of(context)!.areYouSureYouWantToDeleteYourAccount,
                buttonText: AppLocalizations.of(context)!.delete,
                isDelete: true,
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

  showModal({title, subtitle, buttonText, buttonAction, isDelete = false}) {
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
                        AppLocalizations.of(context)!.cancel,
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
                        backgroundColor:
                            isDelete
                                ? AppColors.danger
                                : Colors.teal, // Match the button color
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
