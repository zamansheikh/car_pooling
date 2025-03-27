import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/view/menu/local_compoent/profile_image_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInformationScreen extends StatelessWidget {
  const MyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("My Information"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  ProfileImageSelector(radius: 70, onImageSelect: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
