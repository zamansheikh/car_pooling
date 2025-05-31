import 'package:car_pooling/core/common/package_extensions/IntlPhoneField/intl_phone_field.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoneInputField extends StatelessWidget {
  CustomPhoneInputField({super.key, required this.controller, this.title});
  final TextEditingController controller;
  final String? title;

  final _border = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryLight),
    borderRadius: BorderRadius.circular(12.w),
  );

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: '', // This removes the number length count
        enabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _border,
        focusedErrorBorder: _border,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      ),
      validator: (phone) {
        if (phone != null) {
          if (phone.number.isEmpty) {
            return 'Phone number is required!';
          }
        }
        return null;
      },
      keyboardType: TextInputType.number,
      initialCountryCode: 'TR', // Contry code for Turkey
      onChanged: (phone) {
        //  if (!RegExp(r'^\d+$').hasMatch(phone.number)) {
        //   print("detecting laters");
        //   controller.text = '';
        //   showCustomSnackBar('Please enter only numbers.', isError: true);

        // } else {
        //   controller.text = phone.completeNumber;
        // }
        // saving the phone number in the controller
        controller.text = phone.completeNumber;
      },
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
