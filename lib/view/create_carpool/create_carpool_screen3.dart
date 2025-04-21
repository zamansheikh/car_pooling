import 'package:car_pooling/controller/carpooling_controller.dart';
import 'package:car_pooling/core/components/custom_alert_dialog.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/core/components/image_renderer.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_icons.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/core/wrappers/option_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateCarpoolScreen3 extends StatelessWidget {
  CreateCarpoolScreen3({super.key});
  final CarpoolingController controller = Get.find<CarpoolingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Invite" ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Who", style: AppStyle.largeMedium),
              SizedBox(height: 12.h),
              CustomInputField(
                controller: controller.searchContactController,
                hintText: "Searching the parent" ,
                prefixIcon: AppIcons.serchIcon,
              ),
              SizedBox(height: 24.h),
              OptionWrapper(
                // the upper column is for adding add contact button at the end
                child: Column(
                  children: [
                    // This inner column is for rendering the contacts
                    Column(
                      children:
                          controller.myContact
                              .map(
                                (el) => Column(
                                  children: [
                                    Row(
                                      spacing: 12.w,
                                      children: [
                                        CircleAvatar(
                                          radius: 28.r,
                                          backgroundColor:
                                              AppColors
                                                  .background, // Placeholder color
                                          child:
                                              el.image == ''
                                                  ? Text(
                                                    "${el.firstName[0]}${el.lastName[0]}",
                                                    style:
                                                        AppStyle.headerRegular3,
                                                  )
                                                  : imageRenderer(
                                                    url: el.image,
                                                    borderRadius: 100,
                                                    size: 56,
                                                  ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${el.firstName} ${el.lastName}",
                                              style: AppStyle.baseMedium,
                                            ),
                                            Text(
                                              "${el.cellNumber} ",
                                              style: AppStyle.baseSmallRegular,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              )
                              .toList(),
                    ),
                    // add more button goes here
                    GestureDetector(
                      onTap: () {
                        // TODO: add "add contact functionality"
                      },
                      child: Row(
                        spacing: 12,
                        children: [
                          Icon(Icons.add),
                          Text("Add Contacts" , style: AppStyle.baseMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Add message goes here
              Text("Add Message" , style: AppStyle.largeMedium),
              SizedBox(height: 12.h),
              CustomInputField(
                controller: controller.addMessageController,
                maxLines: 5,
                background: AppColors.white,
              ),
              SizedBox(height: 24.h),
              // carpool details goes here
              OptionWrapper(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8.h,
                      children: [
                        Text("Carpool Details" , style: AppStyle.largeMedium),
                        buildDetails(
                          key: "Event Name" ,
                          value: controller.eventNameController.text,
                        ),
                        buildDetails(
                          key: "From" ,
                          value: controller.startLocationController.text,
                        ),
                        buildDetails(
                          key: "To" ,
                          value: controller.endLocationController.text,
                        ),
                        buildDetails(
                          key: "On" ,
                          value:
                              "${controller.returnDateController.text} at ${controller.timePicker.value.hour % 12}:${controller.timePicker.value.minute} ${controller.timePicker.value.period == DayPeriod.pm ? "PM" : "AM"}",
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        "Edit" ,
                        style: AppStyle.baseMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              CustomButton(
                buttonTitle:
                    "${"Send" } ${controller.myContact.length} ${"Invites" }",
                onTap: () {
                  showDialog(
                    context: Get.context!,
                    builder: (context) {
                      return customAlertDialog(
                        asset: AppIcons.congratsIcon,
                        buttonText: "Home" ,
                        content: "Invitation is Successfull!" ,
                        title: "Invite Sent!" ,
                        route: () {
                          Get.toNamed(AppRoutes.homeSCreen);
                        },
                        // TODO: Implement Home route and connect with home route
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildDetails({key, value}) {
    return Row(
      spacing: 12.w,
      children: [
        Text(
          "$key:",
          style: AppStyle.baseSmallMedium.copyWith(color: AppColors.gray),
        ),
        Text(value, style: AppStyle.baseSmallMedium),
      ],
    );
  }
}
