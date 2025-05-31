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
import 'package:car_pooling/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../l10n/app_localizations.dart';

class CreateCarpoolScreen3 extends StatelessWidget {
  CreateCarpoolScreen3({super.key});
  final CarpoolingController controller = Get.find<CarpoolingController>();

  List<Widget> _contactList() {
    return controller.myContact.map((item) {
      return Column(
        children: [
          Row(
            spacing: 12.w,
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundColor: AppColors.background, // Placeholder color
                child:
                    item.image == ''
                        ? Text(
                          "${item.firstName[0]}${item.lastName[0]}",
                          style: AppStyle.headerRegular3,
                        )
                        : imageRenderer(
                          url: item.image,
                          borderRadius: 100,
                          size: 56,
                        ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.firstName} ${item.lastName}",
                    style: AppStyle.baseMedium,
                  ),
                  Text("${item.cellNumber} ", style: AppStyle.baseSmallRegular),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  _showRemoveConfirmation(item);
                },
                child: Icon(
                  Icons.close_rounded,
                  color: AppColors.danger,
                  size: 24.w,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      );
    }).toList();
  }

  void _showRemoveConfirmation(ContactModel item) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return customAlertDialog(
          centerHeading: true,
          title: 'Remove Invitee',
          content:
              'Are you sure you want to remove the invitee from the invite?',
          isConfirm: true,
          isDelete: true,
          buttonText: 'Remove',
          route: () {
            controller.removeContact(item);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(AppLocalizations.of(context)!.invite),
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
                hintText: "Search contact...",
                prefixIcon: AppIcons.serchIcon,
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                constraints: BoxConstraints(maxHeight: 248.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.1 * 255).toInt()),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: ScrollController(initialScrollOffset: 0.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 6.h,
                      ),
                      child: Obx(() {
                        return Column(children: _contactList());
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // Add message goes here
              Text(
                AppLocalizations.of(context)!.addNote,
                style: AppStyle.largeMedium,
              ),
              SizedBox(height: 12.h),
              CustomInputField(
                controller: controller.addMessageController,
                maxLines: 5,
                maxLength: 300,
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
                        Text(
                          AppLocalizations.of(context)!.carpoolDetails,
                          style: AppStyle.largeMedium,
                        ),
                        buildDetails(
                          value: controller.eventNameController.text,
                        ),
                        buildDetails(
                          key: AppLocalizations.of(context)!.from,
                          value: controller.startLocationController.text,
                        ),
                        buildDetails(
                          key: AppLocalizations.of(context)!.to,
                          value: controller.endLocationController.text,
                        ),
                        buildDetails(
                          key: AppLocalizations.of(context)!.on,
                          value:
                              "${controller.startDate.text} at ${controller.startTime.value!.hour % 12 < 10 ? "0${controller.startTime.value!.hour % 12}" : controller.startTime.value!.hour % 12}:${controller.startTime.value!.minute < 10 ? "0${controller.startTime.value!.minute}" : controller.startTime.value!.minute} ${controller.startTime.value!.period == DayPeriod.pm ? "PM" : "AM"}",
                        ),
                        buildDetails(
                          key: AppLocalizations.of(context)!.estimatedEndTime,
                          value:
                              "${controller.dropOffTime.value!.hour % 12 < 10 ? "0${controller.dropOffTime.value!.hour % 12}" : controller.dropOffTime.value!.hour % 12}:${controller.dropOffTime.value!.minute < 10 ? "0${controller.dropOffTime.value!.minute}" : controller.dropOffTime.value!.minute} ${controller.dropOffTime.value!.period == DayPeriod.pm ? "PM" : "AM"}",
                        ),
                        if (controller.isReturnTrip.value)
                          buildDetails(
                            key: "Return",
                            value:
                                "${controller.startDate.text} at ${controller.returnStartTime.value!.hour % 12 < 10 ? "0${controller.returnStartTime.value!.hour % 12}" : controller.returnStartTime.value!.hour % 12}:${controller.returnStartTime.value!.minute < 10 ? "0${controller.returnStartTime.value!.minute}" : controller.returnStartTime.value!.minute} ${controller.returnStartTime.value!.period == DayPeriod.pm ? "PM" : "AM"}",
                          ),
                        if (controller.isReturnTrip.value)
                          buildDetails(
                            key: AppLocalizations.of(context)!.estimatedEndTime,
                            value:
                                "${controller.returnEndTime.value!.hour % 12 < 10 ? "0${controller.returnEndTime.value!.hour % 12}" : controller.returnEndTime.value!.hour % 12}:${controller.returnEndTime.value!.minute < 10 ? "0${controller.returnEndTime.value!.minute}" : controller.returnEndTime.value!.minute} ${controller.returnEndTime.value!.period == DayPeriod.pm ? "PM" : "AM"}",
                          ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        AppLocalizations.of(context)!.edit,
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
                    "${AppLocalizations.of(context)!.send} ${controller.myContact.length} ${AppLocalizations.of(context)!.invites}",
                onTap: () {
                  showDialog(
                    context: Get.context!,
                    builder: (context) {
                      return customAlertDialog(
                        centerHeading: true,
                        icon: AppIcons.congratsIcon,
                        buttonText: AppLocalizations.of(context)!.home,
                        content:
                            AppLocalizations.of(
                              context,
                            )!.invitationHasBeenSuccessfullySent,
                        title: AppLocalizations.of(context)!.inviteSent,
                        route: () {
                          Get.toNamed(AppRoutes.homeScreen);
                        },
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
