import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/utils/regex_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({
    super.key,
    required this.controller,
    this.validator,
    this.isEmail = false,
    this.isPassword = false,
    this.title,
    this.prefixIcon,
    this.maxLines = 1,
    this.hintText,
    this.background,
    this.isNumber = false,
    this.onChanged,
    this.maxLength,
  });

  final String? title;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool isEmail;
  final bool isPassword;
  final String? prefixIcon;
  final int maxLines;
  final TextEditingController controller;
  final Color? background;
  final bool isNumber;
  final Function(String)? onChanged;
  final int? maxLength;

  // To track obscure and unobsure state of password text
  final RxBool isObscure = true.obs;

  final _border = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryLight),
    borderRadius: BorderRadius.circular(12.w),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final obscure = isObscure.value;
      return TextFormField(
        onChanged: onChanged,
        keyboardType: isNumber ? TextInputType.number : null,
    
        inputFormatters:
            isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
        controller: controller,
    
        // To remove default styling and setting hint text
        decoration: InputDecoration(
          fillColor: background ?? AppColors.background,
          filled: true,
          hintText: hintText ?? title ?? "",
          suffixIcon:
              isPassword
                  ? Obx(() {
                    return InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        isObscure.value = !isObscure.value;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: Icon(
                          isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20,
                          color: AppColors.gray,
                        ),
                      ),
                    );
                  })
                  : null,
          prefixIcon:
              prefixIcon != null
                  ? SizedBox(
                    width: 18.w,
                    height: 18.w,
                    child: Center(
                      child: SvgPicture.asset(
                        prefixIcon!,
                        width: 22.w,
                        height: 22.w,
                        color: AppColors.gray,
                      ),
                    ),
                  )
                  : null,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          errorBorder: _border,
          focusedErrorBorder: _border,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 18.h,
          ),
          hintStyle: GoogleFonts.roboto(
            fontSize: 16.sp,
            color: AppColors.gray,
          ),
        ),
    
        style: GoogleFonts.roboto(
          // Style for the input text
          fontSize: 16.sp,
        ),
    
        obscureText: isPassword ? obscure : false,
    
        //  The maxlines determines the number of lines that can occupy the field
        maxLines: maxLines,
        // shows
        maxLength: maxLength,
    
        // This is to validate fields based conditions
        validator: (value) {
          if (value == null || value.isEmpty) {
            // if the value of field is empty
            return "This field cannot be empty.";
          }
          if (isEmail) {
            if (!RegexValidators.isValidEmail(value)) {
              // if email and not validated then the following the error will be shown
              return "Please enter a valid email address.";
            }
          }
          if (isPassword) {
            if (!RegexValidators.isValidPassword(value)) {
              // password validating on length
              return "Must be 8+ chars with upper, lower, number & symbol.";
            }
          }
          // default return of null
          return null;
        },
      );
    });
  }
}
