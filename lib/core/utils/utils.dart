import 'package:car_pooling/core/constant/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

String imageUrl(String? url) {
  if (url == null || url.isEmpty) {
    return "https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0=";
  } else {
    if (url.startsWith("http")) {
      return url;
    }
    return ApiConstants.baseAssetURL + url;
  }
}

Widget svgViewer({
  required String asset,
  double? height,
  double? width,
  Color? color,
}) {
  return SvgPicture.asset(
    asset,
    height: height,
    width: width,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}
