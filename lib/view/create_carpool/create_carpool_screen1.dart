import 'package:car_pooling/controller/carpooling_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/core/wrappers/option_wrapper.dart';
import 'package:car_pooling/model/child_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateCarpoolScreen1 extends StatelessWidget {
  CreateCarpoolScreen1({super.key});

  final CarpoolingController controller = Get.find<CarpoolingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Create carpool".tr, hasBack: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Which child(ren) will attend the event?*",
                style: AppStyle.largeMedium,
              ),
              SizedBox(height: 12.h),
              // =========>>>>>>>>> Choose child list <<<<<<<<<=========
              OptionWrapper(
                child: Column(
                  children: [
                    Obx(() {
                      // this column generates the children option to choose from
                      return Column(
                        children:
                            controller.availableChildren.map((el) {
                              return BuildOptionChildrenRole(
                                onChange: (val) {
                                  if (val != null) {
                                    el.isSelected = val;
                                    controller.availableChildren.refresh();
                                  }
                                },
                                status: el.isSelected,
                                title: el.fullName,
                              );
                            }).toList(),
                      );
                    }),
                    GestureDetector(
                      onTap: () {
                        // TODO: take the user to add child screen
                        controller.availableChildren.add(
                          ChildModel(fullName: "New child".tr),
                        );
                        controller.availableChildren.refresh();
                      },
                      // This row is the button to add more children
                      child: Row(
                        spacing: 6.w,
                        children: [
                          Icon(Icons.add, color: AppColors.primaryDark),
                          Text(
                            "Add new child(ren)".tr,
                            style: AppStyle.baseMedium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text("My Role".tr, style: AppStyle.largeMedium),
              SizedBox(height: 12.h),
              // =========>>>>>>>>> Choose my role <<<<<<<<<=========
              // TODO: Implment chosing only one, stop multiple chosing
              OptionWrapper(
                child: Obx(() {
                  return Column(
                    children: List.generate(controller.myRole.length, (index) {
                      final el = controller.myRole[index];
                      return BuildOptionChildrenRole(
                        onChange: (val) {
                          if (val != null) {
                            el.isSelected = val;
                            controller.myRole.refresh();
                          }
                        },
                        status: el.isSelected,
                        title: el.name,
                        showDivider: index != (controller.myRole.length - 1),
                      );
                    }),
                  );
                }),
              ),
              // =========>>>>>>>>> Next Button <<<<<<<<<=========
              SizedBox(height: 24.h),
              CustomButton(
                buttonTitle: "Next".tr,
                isRounded: false,
                onTap: () {
                  Get.toNamed(AppRoutes.createCarpool2);
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildOptionChildrenRole extends StatelessWidget {
  // This Class is only used in the carpoolingscreen1,
  // as the name suggests, this option builds two types of options
  // one children selector (multiple)
  // another role selector (single)
  const BuildOptionChildrenRole({
    super.key,
    required this.onChange,
    required this.status,
    required this.title,
    this.showDivider = true,
  });

  final Function(bool?) onChange;
  final bool status;
  final String title;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              value: status,
              onChanged: onChange,
            ),
            Text(title, style: AppStyle.baseMedium),
          ],
        ),
        if (showDivider) Divider(),
      ],
    );
  }
}
