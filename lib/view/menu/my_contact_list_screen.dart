import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/contact_card.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../l10n/app_localizations.dart';

class MyContactListScreen extends StatelessWidget {
  MyContactListScreen({super.key});
  final MenuProfileController controller = Get.find<MenuProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.chevron_left_sharp, size: 32.sp),
        ),
        title: Text(
          AppLocalizations.of(context)!.contactList,
          style: AppStyle.largeMedium,
        ),
        actions: [
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 18.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    AppLocalizations.of(context)!.addContact,
                    style: AppStyle.baseSmallMedium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
