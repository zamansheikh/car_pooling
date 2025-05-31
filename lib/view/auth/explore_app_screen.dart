import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreAppScreen extends StatelessWidget {
  const ExploreAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            SizedBox(height: 56.h),
            Text(
              "Explore the App!",
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "HadiKid helps you organize carpooling for your children's school and extracurricular activities in just minutes. It reduces your transportation costs while letting you track your daily carpool schedule and stay informed about whose turn it is to drive.",
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 12.h),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'For more information please visit ',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: 'www.hadikid.com ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () async {
                            if (!await launchUrl(
                              Uri.parse("https://hadikid.com"),
                            )) {
                              throw Exception(
                                'Could not launch https://hadikid.com',
                              );
                            }
                          },
                  ),
                  TextSpan(
                    text: 'especially the ',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: 'About Us ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () async {
                            if (!await launchUrl(
                              Uri.parse("https://hadikid.com/hakkimizda.html"),
                            )) {
                              throw Exception(
                                'Could not launch https://hadikid.com/hakkimizda.html',
                              );
                            }
                          },
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: 'Support ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () async {
                            if (!await launchUrl(
                              Uri.parse("https://hadikid.com/destek.html"),
                            )) {
                              throw Exception(
                                'Could not launch https://hadikid.com/destek.html',
                              );
                            }
                          },
                  ),
                  TextSpan(
                    text: 'pages.',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            Text(
              "Below you will find the names of the main menu buttons along with their use cases.",
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 18.h),
            //  Find families
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Find Families: ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Allows users to search for other HadiKid users to invite and add to their contact list.',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Schedule: ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Displays the carpool events you\'re attending, organizing. or driving for.',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Create: ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Enables users to create carpool events and invite families who might wan to share a ride.',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Inbox: ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Shows your chats, carpool invites, and contact requests, allowing you to respond to them.',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Menu: ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Provides access to additional features such as carpools, profile. account ttings, contact list and more.',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              buttonTitle: "Next",
              onTap: () => Get.toNamed(AppRoutes.homeScreen),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class WebsiteLinks extends StatelessWidget {
  const WebsiteLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () async {
                if (!await launchUrl(Uri.parse("https://hadikid.com"))) {
                  throw Exception('Could not launch https://hadikid.com');
                }
              },
              icon: Icon(Icons.link, color: AppColors.primary),
              label: Text(
                "hadikid.com",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () async {
                if (!await launchUrl(
                  Uri.parse("https://hadikid.com/hakkimizda.html"),
                )) {
                  throw Exception(
                    'Could not launch https://hadikid.com/hakkimizda.html',
                  );
                }
              },
              icon: Icon(Icons.link, color: AppColors.primary),
              label: Text(
                "About Us",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () async {
                if (!await launchUrl(
                  Uri.parse("https://hadikid.com/destek.html"),
                )) {
                  throw Exception(
                    'Could not launch https://hadikid.com/destek.html',
                  );
                }
              },
              icon: Icon(Icons.link, color: AppColors.primary),
              label: Text(
                "Support",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
