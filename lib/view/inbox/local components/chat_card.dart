import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.image,
    required this.fullName,
    required this.lstMsg,
    required this.lstMsgTime,
  });
  final String image;
  final String fullName;
  final String lstMsg;
  final String lstMsgTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 1, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          CircleAvatar(
            // TODO: implement Image
            radius: 25,
            backgroundColor: AppColors.background, // Placeholder color
            child: Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            ), // Placeholder icon since we don't have the actual image
          ),
          SizedBox(width: 12),
          // Text Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Timestamp Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fullName, style: AppStyle.largeMedium),
                    Text(
                      '08:09 PM',
                      style: AppStyle.baseSmallMedium.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                // Message Text
                Text(
                  'Sequi quae aliquid numquam...',
                  style: AppStyle.baseSmallRegular.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
