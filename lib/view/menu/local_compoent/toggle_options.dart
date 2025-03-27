import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleOption extends StatelessWidget {
  final String title;
  final RxBool value;
  final Function(bool) onChanged;

  const ToggleOption({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Obx(
            () => Switch(
              value: value.value,
              onChanged: onChanged,
              activeColor: AppColors.white,
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: AppColors.lightGray,
              inactiveThumbColor: AppColors.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
