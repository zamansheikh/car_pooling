import 'dart:io';

import 'package:car_pooling/core/components/image_renderer.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageSelector extends StatelessWidget {
  // Custom profile image selector
  // just pass in the prop and create image obs variable and pass it to the image property
  // and create an image selector function to pick the image
  const ProfileImageSelector({
    super.key,
    required this.radius,
    required this.onImageSelect,
    this.image,
    required this.myImageLink,
  });
  final double radius;
  final VoidCallback onImageSelect;
  final File? image;
  final String myImageLink;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius.r,
          child:
              image == null
                  ? imageRenderer(
                    url: "",
                    size: (radius * 2).h,
                    borderRadius: 100,
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      image!,
                      height: (radius * 2).h,
                      width: (radius * 2).w,
                      fit: BoxFit.cover,
                    ),
                  ),
        ),
        Positioned(
          // Division is used to change the position cordinate and the size
          // as the radius changes
          right: (radius / 14).w,
          bottom: (radius / 14).h,
          child: InkWell(
            onTap: onImageSelect,
            child: Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: (radius / 3).sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
