import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
    this.isRounded = true,
    this.isFilled = true,
    this.isRed = false,
    this.widthFactor = 1,
    this.isActive = true,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final String buttonTitle;
  final bool isRounded;
  final bool isFilled;
  final bool isRed;
  final double widthFactor;
  final bool isActive;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: (isFilled && !isRed) ? AppColors.primary : null,
            border: Border.all(
              color: isRed ? AppColors.danger : AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(isRounded ? 100 : 12),
          ),
          child: Center(
            child:
                isLoading
                    ? LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.white,
                      size: 22,
                    )
                    : Text(
                      buttonTitle,
                      style: AppStyle.baseMedium.copyWith(
                        color:
                            isFilled
                                ? Colors.white
                                : isRed
                                ? AppColors.danger
                                : AppColors.primary,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
