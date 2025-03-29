import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/core/utils/app_binding.dart';
import 'package:car_pooling/core/utils/languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: Languages(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          initialBinding: AppBindings.bindings,
          getPages: AppRoutes.pages,
          theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
          initialRoute: AppRoutes.splashScreen,
        );
      },
    ),
  );
}
