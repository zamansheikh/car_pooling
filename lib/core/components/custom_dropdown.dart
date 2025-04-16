import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownInput extends StatelessWidget {
  /*
  CustomDropDownInput is a reusable dropdown widget that allows users to select an option from a list.
  */
  final List<String> options; // List of dropdown options
  final String initialValue; // Initial selected value
  final String hintText; // Hint text (e.g., "Address Title...")
  final Function(String?)? onChanged; // Callback for value changes

  const CustomDropDownInput({
    super.key,
    required this.options,
    required this.initialValue,
    this.hintText = 'Select an option',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // // Initialize the controller
    // final DropDownController controller = Get.put(DropDownController());

    // // Set the initial value if provided
    // if (initialValue != null) {
    //   controller.updateSelectedValue(initialValue);
    // }

    return Container(
      height: 50, // Match the height of the dropdown in the image
      decoration: BoxDecoration(
        // color: Colors.white, // Background color
        border: Border.all(
          color: AppColors.lightGray, // Subtle border color
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: initialValue,
          hint: Text(
            hintText,
            style: TextStyle(
              color: Colors.grey.shade500, // Hint text color
              fontSize: 16,
            ),
          ),
          isExpanded: true, // Make the dropdown take full width
          icon: const Icon(
            Icons.arrow_drop_down, // Downward arrow icon
            color: Colors.grey, // Arrow color
            size: 30,
          ),
          style: const TextStyle(
            color: Colors.black, // Text color for selected item
            fontSize: 16,
          ),
          items:
              options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
