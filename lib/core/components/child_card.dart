import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_icons.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/core/wrappers/card_wrapper.dart';
import 'package:car_pooling/model/child_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({super.key, required this.el});

  final ChildModel el;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.editChild);
      },
      child: CardWrapper(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 12.w,
              children: [
                CircleAvatar(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${el.childFistName} ${el.childLastName}',
                      style: AppStyle.largeMedium,
                    ),
                    Text(
                      el.childSchoolName,
                      style: AppStyle.baseMedium.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8.h,
              children: [
                SvgPicture.asset(AppIcons.editIcon),
                SvgPicture.asset(AppIcons.deleteIcon),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
