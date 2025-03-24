import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTimeInput extends StatelessWidget {
  const CustomTimeInput({
    super.key,
    required this.time,
    required this.onChange,
  });

  final Time time;
  final Function(Time) onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          showPicker(
            context: context,
            value: time,
            sunrise: TimeOfDay(hour: 6, minute: 0), // optional
            sunset: TimeOfDay(hour: 18, minute: 0), // optional
            duskSpanInMinutes: 120, // optional
            onChange: onChange,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Enter your time", style: AppStyle.baseRegular),
      ),
    );
  }
}
