import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/core/utils/app_binding.dart';
import 'package:car_pooling/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          fallbackLocale: const Locale('en', 'US'),
          initialBinding: AppBindings.bindings,
          getPages: AppRoutes.pages,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            fontFamily: 'roboto',
          ),
          initialRoute: AppRoutes.splashScreen,
          locale: Get.deviceLocale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    ),
  );
}
