import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangugeScreen extends StatelessWidget {
  LangugeScreen({super.key});
  final MenuProfileController controller = Get.put(MenuProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Language"),
      body: Obx(
        () => Column(
          children: [
            // Türkçe option
            ListTile(
              title: const Text('Türkçe'),
              trailing: Radio<String>(
                value: 'Türkçe',
                groupValue: controller.selectedLanguage.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedLanguage.value = value;
                    Get.updateLocale(Locale("tr", "TR"));
                  }
                },
              ),
            ),
            // English option
            ListTile(
              title: const Text('English (EN)'),
              trailing: Radio<String>(
                value: 'English (EN)',
                groupValue: controller.selectedLanguage.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedLanguage.value = value;
                    Get.updateLocale(Locale("en", "US"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
