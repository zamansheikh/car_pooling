// ignore_for_file: deprecated_member_use

import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onChanged;
  final int menuIndex;
  const CustomBottomNavigationBar({
    super.key,
    required this.menuIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.dark,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(color: AppColors.white, fontSize: 12.sp),
      selectedLabelStyle: TextStyle(color: AppColors.primary, fontSize: 12.sp),
      currentIndex: menuIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.findfamilyIcon,
            color: menuIndex == 0 ? AppColors.primary : AppColors.white,
          ),
          label: 'Find Families',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.scheduleIcon,
            color: menuIndex == 1 ? AppColors.primary : AppColors.white,
          ),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.add),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.inboxIcon,
            color: menuIndex == 3 ? AppColors.primary : AppColors.white,
          ),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.menuIcon,
            color: menuIndex == 4 ? AppColors.primary : AppColors.white,
          ),
          label: 'Menu',
        ),
      ],
      onTap: onChanged,
    );
  }
}