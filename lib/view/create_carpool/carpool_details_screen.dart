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

import '../../l10n/app_localizations.dart';

enum CarpoolDetailsType { attending, organizing, driving }

class CarpoolDetailsScreen extends StatelessWidget {
  final CarpoolDetailsType? type;
  const CarpoolDetailsScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(
        AppLocalizations.of(context)!.carpoolDetails,
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
                  AppLocalizations.of(context)!.location,
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppIcons.carIcon),
                    SizedBox(width: 8.w),
                    Text(
                      '${AppLocalizations.of(context)!.from}:',
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "123 Mple St",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "-",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '${AppLocalizations.of(context)!.to}:',
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "123 Mple St",
                      style: AppStyle.baseRegular.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 36.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.startTime,
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
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.estimatedEndTime,
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
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 36.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.driver,
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12),
                        // can remove on tap if logged in as driver
                        GestureDetector(
                          onTap: () {
                            if (type != CarpoolDetailsType.driving) return;

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    AppLocalizations.of(context)!.deleteDriver,
                                  ),
                                  content: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.areYouSureYouWantToRemoveYourselfFromThisCarpool,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).pop(); // Close the dialog
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).pop(); // Close the dialog
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
                          AppLocalizations.of(context)!.attendees,
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12),
                        // can remove on tap if logged in as attandee
                        GestureDetector(
                          onTap: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return AlertDialog(
                            //       title: Text(
                            //         AppLocalizations.of(
                            //           context,
                            //         )!.removeAttendee,
                            //       ),
                            //       content: Text(
                            //         AppLocalizations.of(
                            //           context,
                            //         )!.areYouSureYouWantToRemoveThisAttendee,
                            //       ),
                            //       actions: [
                            //         TextButton(
                            //           onPressed: () {
                            //             Navigator.of(
                            //               context,
                            //             ).pop(); // Close the dialog
                            //           },
                            //           child: Text("Cancel"),
                            //         ),
                            //         TextButton(
                            //           onPressed: () {
                            //             // TODO: Add logic to remove attendee
                            //             Navigator.of(
                            //               context,
                            //             ).pop(); // Close the dialog
                            //           },
                            //           child: Text("Remove"),
                            //         ),
                            //       ],
                            //     );
                            //   },
                            // );
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
                if (type == CarpoolDetailsType.organizing)
                  Row(
                    spacing: 12.w,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppIcons.inviteIcon),
                      Text(
                        AppLocalizations.of(context)!.invite,
                        style: AppStyle.baseRegular.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomButton(
                buttonTitle: AppLocalizations.of(context)!.dropOffComplete,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
