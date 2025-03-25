import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  final Widget? extra; // For trailing widgets like text or chevron
  final bool showChevron; // To conditionally show the chevron
  final VoidCallback onPress;

  const MenuOption({
    super.key,
    required this.title,
    required this.icon,
    this.textColor = Colors.black87,
    this.iconColor = Colors.black54,
    this.extra,
    this.showChevron = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            // Icon
            Icon(icon, color: iconColor, size: 24),
            SizedBox(width: 16),
            // Title
            Expanded(child: Text(title, style: AppStyle.baseMedium)),
            // Trailing (either extra widget or chevron)
            if (extra != null) ...[
              extra!,
            ] else if (showChevron) ...[
              // Icon(Icons.chevron_right, color: Colors.black54, size: 24),
            ],
          ],
        ),
      ),
    );
  }
}
