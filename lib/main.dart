import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/core/utils/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: AppBindings.bindings,
          getPages: AppRoutes.pages,
          home: Scaffold(body: Center(child: Text('Hello World!'))),
        );
      },
    ),
  );
}
