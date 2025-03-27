import 'package:car_pooling/core/components/image_renderer.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageSelector extends StatelessWidget {
  const ProfileImageSelector({
    super.key,
    required this.radius,
    required this.onImageSelect,
  });
  final double radius;
  final VoidCallback onImageSelect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius.r,
          child: imageRenderer(
            url: "",
            size: (radius * 2).h,
            borderRadius: 100,
          ),
        ),
        Positioned(
          right: 5.w,
          bottom: 5.h,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.edit, color: Colors.white, size: 22.sp),
            ),
          ),
        ),
      ],
    );
  }
}
