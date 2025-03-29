import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/image_renderer.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/wrappers/card_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

class CarpoolCard extends StatelessWidget {
  const CarpoolCard({
    super.key,
    required this.image,
    required this.eventName,
    required this.fromLocation,
    required this.toLocation,
    required this.date,
    required this.time,
    required this.canDrive,
  });
  final String image;
  final String eventName;
  final String fromLocation;
  final String toLocation;
  final String date;
  final String time;
  final bool canDrive;

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
          if (!canDrive)
            CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.background, // Placeholder color
              child:
                  image == ''
                      ? Text(eventName[0], style: AppStyle.headerRegular3)
                      : imageRenderer(url: image, borderRadius: 100, size: 64),
            ),
          SizedBox(width: 16),
          // Text and Icons Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(eventName, style: AppStyle.largeMedium),
                SizedBox(height: 8),
                // Location Row with Car Icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Icon(
                        Icons.directions_car,
                        color: Colors.teal,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Form $fromLocation -> $toLocation',
                        style: AppStyle.baseSmallRegular.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Time Row with Clock Icon
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.teal, size: 20),
                    SizedBox(width: 8),
                    Text(
                      '${DateFormat('MMMM d,').format(DateTime.parse(date))}, $time',
                      style: AppStyle.baseSmallRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                if (canDrive)
                  CustomButton(
                    buttonTitle: 'Drive'.tr,
                    isRounded: false,
                    onTap: () {
                      // Todo: add drive functionality
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
