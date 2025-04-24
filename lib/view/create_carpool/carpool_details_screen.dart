import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/image_renderer.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_icons.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CarpoolDetailsScreen extends StatelessWidget {
  const CarpoolDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(
        "Carpool Details",
        button: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 20.w),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppIcons.mapIcon, height: 24, width: 24),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 12.w,
                      children: [
                        CircleAvatar(
                          radius: 36,
                          child: imageRenderer(
                            url: "https://thispersondoesnotexist.com/",
                            borderRadius: 100,
                            size: 72,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Johan Alica Robart",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                            Row(
                              spacing: 7.w,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Text(
                                  "4.5",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.messages);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: SvgPicture.asset(AppIcons.mailIcon),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
                Text(
                  "Location",
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10.w,
                  children: [
                    SvgPicture.asset(AppIcons.carIcon),
                    Text(
                      "From",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    Text(
                      "123 Mple St",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: AppColors.gray),
                    Text(
                      "123 Mple St",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
                Text(
                  "Time",
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  spacing: 8.w,
                  children: [
                    SvgPicture.asset(AppIcons.timeIcon),
                    Text(
                      "Jan 24, 3:30PM",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Driver",
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12),
                        // can remove on tap if logged in as driver
                        GestureDetector(
                          onTap: () {
                            //TODO: Show delete dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Delete Driver"),
                                  content: Text("Are you sure you want to remove yourself from this carpool?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // TODO: Add logic to delete driver
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: Text("Delete"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            spacing: 8.w,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                child: imageRenderer(
                                  url: "https://thispersondoesnotexist.com/",
                                  borderRadius: 100,
                                ),
                              ),
                              Text(
                                "Johan Smith",
                                style: AppStyle.baseRegular.copyWith(
                                  color: AppColors.gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Attendees",
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12),
                        // can remove on tap if logged in as attandee
                        GestureDetector(
                          onTap: () {
                      
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Remove Attendee"),
                                  content: Text("Are you sure you want to remove this attendee?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // TODO: Add logic to remove attendee
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: Text("Remove"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            spacing: 8.w,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                child: imageRenderer(
                                  url: "https://thispersondoesnotexist.com/",
                                  borderRadius: 100,
                                ),
                              ),
                              Text(
                                "Johan Smith",
                                style: AppStyle.baseRegular.copyWith(
                                  color: AppColors.gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  spacing: 12.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppIcons.inviteIcon),
                    Text(
                      "invite",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(18),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: CustomButton(buttonTitle: "Drop-Off Complete", onTap: () {}),
          ),
        ],
      ),
    );
  }
}
