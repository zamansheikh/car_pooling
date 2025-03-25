import 'package:car_pooling/core/components/image_renderer.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/core/wrappers/card_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.messages);
      },
      child: CardWrapper(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.background, // Placeholder color
              child:
                  image == ''
                      ? Text(fullName[0], style: AppStyle.headerRegular3)
                      : imageRenderer(url: image, borderRadius: 100, size: 50),
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
      ),
    );
  }
}
