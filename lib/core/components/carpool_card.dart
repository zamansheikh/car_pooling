import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  });
  final String image;
  final String eventName;
  final String fromLocation;
  final String toLocation;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              // TODO: Implement image
              radius: 32,
              backgroundColor: Colors.brown[300], // Placeholder color
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ), // Placeholder icon since we don't have the actual image
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
