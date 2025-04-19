import 'package:car_pooling/core/constant/app_colors.dart'; // Ensure this path is correct
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Not needed for readOnly field
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDateInput extends StatefulWidget {
  const CustomDateInput({
    super.key,
    required this.dateController,
    this.validator, // Validator to be passed from the parent Form
    required this.hintText,
    this.title = "",
    // Icon parameters (keep commented if not currently used)
    // this.icon,
    // this.iconStart = false,
    // this.isLargeIcon = false,
    this.isEnabled = true,
    this.onChanged,
    this.firstDate, // Optional: Allow specifying first selectable date
    this.lastDate, // Optional: Allow specifying last selectable date
    this.initialDate, // Optional: Allow specifying initial picker date
    this.dateFormat = 'MM/dd/yyyy', // Default date format
  });

  final TextEditingController dateController;
  final FormFieldValidator<String>? validator; // Will be used by TextFormField
  // final IconData? icon; // Make nullable if optional
  final String hintText;
  final String title;
  // final bool iconStart;
  // final bool isLargeIcon;
  final bool isEnabled;
  final Function(String)? onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final String dateFormat; // Make format configurable

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  DateTime? _selectedDate; // Keep track of the selected date internally

  @override
  void initState() {
    super.initState();
    // Try to parse the initial date from the controller if it's not empty
    _parseInitialDateFromController();
  }

  void _parseInitialDateFromController() {
    if (widget.dateController.text.isNotEmpty) {
      try {
        _selectedDate = DateFormat(
          widget.dateFormat,
        ).parse(widget.dateController.text);
      } catch (e) {
        // Handle or log parsing error if the initial text doesn't match the format
        debugPrint("Error parsing initial date from controller: $e");
        _selectedDate = null; // Reset if parsing fails
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 6.0,
            ), // Add some bottom padding
            child: Text(
              widget.title,
              style: GoogleFonts.roboto(
                // Consider using AppStyle if available
                fontSize: 14.sp,
                fontWeight:
                    FontWeight
                        .w500, // Medium weight might look better for titles
                color: AppColors.darkGray, // Use colors from your theme
              ),
            ),
          ),
        // Use TextFormField directly for better integration with Form
        TextFormField(
          controller: widget.dateController,
          readOnly: true, // Important: User picks date, doesn't type
          enabled: widget.isEnabled,
          style: GoogleFonts.roboto(
            // Style for the input text
            fontSize: 14.sp,
            color: widget.isEnabled ? AppColors.darkGray : Colors.grey.shade600,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.roboto(
              fontSize: 14.sp,
              color: AppColors.gray, // Lighter color for hint text
            ),
            // Consistent border styling
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ), // Highlight focus
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.red.shade700),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.red.shade700, width: 1.5),
            ),
            disabledBorder: OutlineInputBorder(
              // Style when disabled
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            // Fill color to visually distinguish disabled state
            filled: !widget.isEnabled,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 12.h,
            ), // Adjust padding
            // Suffix icon to indicate date picker
            suffixIcon: Icon(
              Icons
                  .calendar_today_outlined, // Use outlined version for modern look
              color: widget.isEnabled ? AppColors.darkGray : Colors.grey,
              size: 20.sp,
            ),
            // Remove icon logic from here if using suffixIcon
            // prefixIcon: widget.iconStart ? Icon(...) : null,
          ),
          // *** THE CORE FIX: Use the validator passed in via the widget ***
          validator: widget.validator,
          onTap:
              widget
                      .isEnabled // Only allow tap if enabled
                  ? () async {
                    // Dismiss keyboard if another field had focus
                    FocusScope.of(context).requestFocus(FocusNode());

                    final DateTime? picked = await showDatePicker(
                      context: context,
                      // Use provided initial date, then internal state, then default
                      initialDate:
                          widget.initialDate ?? _selectedDate ?? DateTime.now(),
                      firstDate:
                          widget.firstDate ??
                          DateTime(2000), // Use provided or default
                      lastDate:
                          widget.lastDate ??
                          DateTime(2101), // Use provided or default
                      // Optional: Apply themeing consistent with your app
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: Theme.of(context).colorScheme.copyWith(
                              primary: AppColors.primary, // Header background
                              onPrimary: Colors.white, // Header text
                              onSurface: AppColors.darkGray, // Calendar text
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    AppColors
                                        .primary, // Button text (OK, Cancel)
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    // If a date is picked, update state and controller
                    if (picked != null) {
                      setState(() {
                        _selectedDate = picked;
                        // Format the date using the specified format
                        widget.dateController.text = DateFormat(
                          widget.dateFormat,
                        ).format(picked);
                        // Call onChanged callback if provided
                        if (widget.onChanged != null) {
                          widget.onChanged!(widget.dateController.text);
                        }
                      });
                      // Optional: After setting text, manually trigger validation if needed immediately
                      // (usually not necessary as Form.validate() handles it on submit)
                      // Form.of(context)?.validate();
                    }
                  }
                  : null, // Disable onTap if widget is not enabled
          // No need for keyboardType or inputFormatters on a readOnly field
        ),
      ],
    );
  }
}
