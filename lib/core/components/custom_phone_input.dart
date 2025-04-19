import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneInputField extends StatelessWidget {
  const CustomPhoneInputField({
    super.key,
    required this.controller,
    this.title,
  });
  final TextEditingController controller;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, style: AppStyle.baseSmallRegular),
        if (title != null) SizedBox(height: 8.h),
        Container(
          // Container to style the field
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryLight),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IntlPhoneField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              counterText: '', // This removes the number length count
            ),
            validator: (phone) {
              if (phone != null) {
                if (phone.number.isEmpty) {
                  return 'Phone number is required';
                } else if (phone.number.length > 11 && !phone.isValidNumber()) {
                  return 'Enter a valid phone number';
                }
              }
              return null;
            },
            keyboardType: TextInputType.number,
            initialCountryCode: 'TR', // Contry code for Turkey
            onChanged: (phone) {
              // saving the phone number in the controller
              controller.text = phone.completeNumber;
            },
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ],
    );
  }
}
