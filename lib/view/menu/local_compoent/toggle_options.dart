import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/view/menu/local_compoent/upgrade_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleOption extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  final bool isLocked;

  const ToggleOption({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),

          isLocked
              ? InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return upgradeDialog();
                    },
                  );
                },
                child: Container(
                  height: 35.h,
                  width: 60.w,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.darkGray, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                      ),
                      Icon(Icons.lock, size: 14, color: AppColors.primaryDark),
                    ],
                  ),
                ),
              )
              : Switch(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.lightGray,
                inactiveThumbColor: AppColors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
        ],
      ),
    );
  }
}
