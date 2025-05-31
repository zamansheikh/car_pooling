import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/child_card.dart';
import 'package:car_pooling/core/components/custom_alert_dialog.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/show_custom_snackbar.dart';
import 'package:car_pooling/core/components/spouse_card.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/view/menu/edit_child_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/app_localizations.dart';

class MyChildrenScreen extends StatelessWidget {
  MyChildrenScreen({super.key});

  // Use Get.put only if this screen is responsible for creating the controller instance
  // If the controller is created elsewhere (e.g., in main or a binding), use Get.find()
  final MenuProfileController controller = Get.put(MenuProfileController());

  @override
  Widget build(BuildContext context) {
    // Wrap the Scaffold with DefaultTabController
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: customAppBar1(
          AppLocalizations.of(context)!.myFamilyMembers,
          hasTabBar: true, // Ensure this tells customAppBar1 to add a TabBar
          tabs: [
            Tab(text: AppLocalizations.of(context)!.children), // First tab
            Tab(text: AppLocalizations.of(context)!.spouse), // Second tab
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          // TabBarView needs children corresponding to the tabs in order
          child: TabBarView(
            children: [
              // Content for the FIRST tab ("Children")
              Obx(() {
                if (controller.mySpouseList.isEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:
                            () => {
                              Get.to(() => EditChildScreen(isSpouse: true)),
                            },

                        child: Container(
                          margin: EdgeInsets.only(top: 48.h),
                          child: Row(
                            spacing: 4.w,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.primaryDark,
                                size: 24.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.addChild,
                                style: AppStyle.baseSmallRegular.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  // Build the list if not empty
                  return ListView(
                    children: [
                      ...controller.myChildrenList.asMap().entries.map((entry) {
                        final index = entry.key;

                        if (index >= controller.myChildrenList.length) {
                          return const SizedBox.shrink();
                        }
                        final child = controller.myChildrenList[index];
                        return ChildCard(
                          el: child,
                          onTapDelete: () {
                            // Consider adding confirmation dialog before deleting
                            if (controller.myChildrenList.length > 1) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return customAlertDialog(
                                    centerHeading: true,
                                    title: "Delete Child",
                                    content:
                                        "Are you sure you want to delete this child?",

                                    buttonText: "Delete",
                                    isConfirm: true,
                                    isDelete: true,
                                    route: () {
                                      controller.myChildrenList.removeAt(index);
                                    },
                                  );
                                },
                              );
                            } else {
                              showCustomSnackBar(
                                AppLocalizations.of(
                                  context,
                                )!.atLeastOneChildMustBeSaved,
                              );
                            }
                          },
                          onTapEdit: () {
                            Get.toNamed(AppRoutes.editChild);
                          },
                        );
                      }).toList(),
                      GestureDetector(
                        onTap: () => {Get.to(() => EditChildScreen())},

                        child: Container(
                          margin: EdgeInsets.only(top: 18.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 4.w,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.primaryDark,
                                size: 24.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.addChild,
                                style: AppStyle.baseSmallRegular.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }),

              // Content for the SECOND tab ("Spouse")
              Obx(() {
                if (controller.mySpouseList.isEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:
                            () => {
                              Get.to(() => EditChildScreen(isSpouse: true)),
                            },

                        child: Container(
                          margin: EdgeInsets.only(top: 48.h),
                          child: Row(
                            spacing: 4.w,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.primaryDark,
                                size: 24.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.addSpouse,
                                style: AppStyle.baseSmallRegular.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.mySpouseList.length,
                    itemBuilder: (context, index) {
                      // Prevent index out of bounds if list is modified concurrently
                      if (index >= controller.mySpouseList.length) {
                        return const SizedBox.shrink();
                      }
                      final spouse = controller.mySpouseList[index];
                      return SpouseCard(
                        el: spouse,

                        onTapDelete: () {
                          // Consider adding confirmation dialog before deleting
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return customAlertDialog(
                                centerHeading: true,
                                title: "Delete Spouse",
                                content:
                                    "Are you sure you want to delete your spouse?",

                                buttonText: "Delete",
                                isConfirm: true,
                                isDelete: true,
                                route: () {
                                  controller.mySpouseList.removeAt(index);
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

void showDeleteConfirmationDialog({
  required VoidCallback onDelete,
  required String title,
  String? subTitle,
}) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: GoogleFonts.roboto(fontWeight: FontWeight.w600)),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (subTitle != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        ),
        actions: [
          Row(
            spacing: 12.w,
            children: [
              dialogButton(
                onTap: () {
                  Get.back();
                },
                titleText: AppLocalizations.of(context)!.cancel,
                isDanger: false,
              ),
              dialogButton(
                onTap: () {
                  onDelete();
                  Get.back();
                },
                titleText: AppLocalizations.of(context)!.delete,
              ),
            ],
          ),
        ],
      );
    },
  );
}

Expanded dialogButton({
  required titleText,
  required onTap,
  bool isDanger = true,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: isDanger ? null : Border.all(color: AppColors.darkGray),
          color: isDanger ? AppColors.danger : null,
        ),
        child: Center(
          child: Text(
            titleText,
            style: TextStyle(
              color: isDanger ? Colors.white : AppColors.darkGray,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
