import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/utils/regex_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({
    super.key,
    required this.controller,
    this.isEmail = false,
    this.isPassword = false,
    this.title,
    this.prefixIcon,
    this.maxLines = 1,
  });

  final String? title;
  final bool isEmail;
  final bool isPassword;
  final String? prefixIcon;
  final int maxLines;
  final TextEditingController controller;

  // To track obscure and unobsure state of password text
  final RxBool isObscure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // the title with the sizedbox will only be rendered when it is provided
        if (title != null) Text(title!, style: AppStyle.baseSmallRegular),
        if (title != null) SizedBox(height: 8.h),
        // To design the text field container is used
        Obx(() {
          final obscure = isObscure.value;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryLight),
              borderRadius: BorderRadius.circular(12),
            ),
            // Row is used for prefix icons and suffix icons
            child: Row(
              crossAxisAlignment:
                  maxLines == 1
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                if (prefixIcon != null)
                  SvgPicture.asset(prefixIcon!, height: 20.h, width: 20.w),
                if (prefixIcon != null) SizedBox(width: 12.w),
                Flexible(
                  child: TextFormField(
                    controller: controller,
                    // To remove default styling and setting hint text
                    decoration: InputDecoration(
                      hintText:
                          title != null
                              ? "Enter your $title..."
                              : "Enter here....",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),

                    obscureText: isPassword ? obscure : false,

                    //  The maxlines determines the number of lines that can occupy the field
                    maxLines: maxLines,
                    // This is to validate fields based conditions
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // if the value of field is empty
                        return "This field cannot be empty";
                      }
                      if (isEmail) {
                        if (!RegexValidators.isValidEmail(value)) {
                          // if email and not validated then the following the error will be shown
                          return "Please Enter valid $value";
                        }
                      }
                      if (isPassword) {
                        if (value.length < 8) {
                          // password validating on length
                          return "Please Enter valid $value";
                        }
                      }
                      // default return of null
                      return null;
                    },
                  ),
                ),
                // for obscure and unobscure text
                if (isPassword) SizedBox(width: 12.h),
                if (isPassword)
                  Obx(() {
                    return InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        isObscure.value = !isObscure.value;
                      },
                      child: Icon(
                        isObscure.value ? Icons.visibility : Icons.visibility,
                        size: 20,
                      ),
                    );
                  }),
              ],
            ),
          );
        }),
      ],
    );
  }
}
