import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/utils/utils.dart';
import 'package:flutter/material.dart';

Widget imageRenderer({String? url, size = 112, width, borderRadius}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(
      double.parse((borderRadius ?? 12).toString()),
    ),
    child: Image.network(
      (url == null || url.isEmpty)
          ? "https://w0.peakpx.com/wallpaper/961/507/HD-wallpaper-sung-jin-woo-solo-leveling-thumbnail.jpg"
          : imageUrl(
            url,
          ), // Assuming imageUrl() just returns the URL string; adjust if it does more
      height: double.parse(size.toString()),
      width:
          width == null
              ? double.parse(size.toString())
              : double.parse(width.toString()),
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child; // Image is fully loaded
        return imagePlaceHolder(CircularProgressIndicator(), size, width);
      },
      errorBuilder: (context, error, stackTrace) {
        return imagePlaceHolder(Icon(Icons.error), size, width);
      },
    ),
  );
}

Widget imagePlaceHolder(child, size, width) {
  return Container(
    height: double.parse(size.toString()),
    width:
        width == null
            ? double.parse(size.toString())
            : double.parse(width.toString()),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryLight),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(child: child),
  );
}
