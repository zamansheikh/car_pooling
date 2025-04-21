import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/contact_card.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyContactListScreen extends StatelessWidget {
  MyContactListScreen({super.key});
  final MenuProfileController controller = Get.find<MenuProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("My contact list" , hasInvite: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.myContactList.length,
            itemBuilder: (context, index) {
              final contact = controller.myContactList[index];
              return ContactCard(
                fullName: "${contact.firstName} ${contact.lastName}",
                address: contact.address,
                image: contact.image,
                distance: contact.distance,
                hasDelete: true,
                onDelete: () {
                  controller.myContactList.removeAt(index);
                  controller.myContactList.refresh();
                  Get.back();
                },
              );
            },
          );
        }),
      ),
    );
  }
}
