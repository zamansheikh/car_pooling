import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDateInput extends StatefulWidget {
  const CustomDateInput({
    super.key,
    required this.dateController,
    // required this.icon,
    required this.hintText,
    this.title = "",
    this.iconStart = false,
    this.isLargeIcon = false,
    this.isEnabled = true,
    this.onChanged,
  });

  final TextEditingController dateController;
  // final IconData icon;
  final String hintText;
  final String title;
  final bool iconStart;
  final bool isLargeIcon;
  final bool isEnabled;
  final Function(String)? onChanged;

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          Text(
            widget.title,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF333333),
            ),
          ),
        if (widget.title.isNotEmpty) SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGray),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // if (widget.iconStart)
              //   Icon(
              //     widget.icon,
              //     color: Colors.black,
              //     size: widget.isLargeIcon ? 22 : 14,
              //   ),
              if (widget.iconStart) SizedBox(width: 8),
              Flexible(
                // Text Field
                child: TextFormField(
                  onChanged: widget.onChanged,
                  enabled: widget.isEnabled,
                  controller: widget.dateController,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only allow digits
                  ],
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                        widget.dateController.text = DateFormat(
                          'MM/d',
                        ).format(picked);
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color(0xFF333333)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter your ${widget.hintText}";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(width: 12),
              // if (!widget.iconStart)
              //   Icon(
              //     widget.icon,
              //     color: Colors.black,
              //     size: widget.isLargeIcon ? 22 : 14,
              //   ),
            ],
          ),
        ),
      ],
    );
  }
}
