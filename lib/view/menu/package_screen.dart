import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackageScreen extends StatelessWidget {
  PackageScreen({super.key});

  final MenuProfileController controller = Get.put(MenuProfileController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: customAppBar1(
          "Packages",
          hasTabBar: true,
          tabs: [Tab(text: "Hadikid Free"), Tab(text: "Hadikid Premium")],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: TabBarView(children: [buildHadikidFree(), buildHadikidFree()]),
        ),
      ),
    );
  }

  buildHadikidFree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Feature List
        FeatureItem(text: 'HadiKid No Ads'),
        FeatureItem(text: 'Live Tracking'),
        FeatureItem(text: 'Added Notification'),
        FeatureItem(text: 'Carpool History'),
        FeatureItem(text: 'Add message'),
        SizedBox(height: 24),
        Text(
          'Choose between monthly or yearly billing and start enjoying your premium features.',
          style: AppStyle.baseRegular.copyWith(color: AppColors.primaryDark),
        ),
        SizedBox(height: 16),
        // Billing Options
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return BillingOption(
                title: 'Yearly',
                price: '\$39.99 per year',
                isSelected: controller.isYearly.value == "Yearly",
                onTap: () {
                  controller.isYearly.value = "Yearly";
                },
              );
            }),
            Obx(() {
              return BillingOption(
                title: 'Monthly',
                price: '\$3.99 per month',
                isSelected: controller.isYearly.value == "Monthly",
                onTap: () {
                  controller.isYearly.value = "Monthly";
                },
              );
            }),
          ],
        ),
        SizedBox(height: 24),

        // Upgrade Button
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            buttonTitle: "Upgrade plan",
            onTap: () {
              Get.toNamed(AppRoutes.payment);
            },
          ),
        ),
        SizedBox(height: 16),

        // Footer Text
        Center(
          child: Text(
            'You\'re currently using HadiKid Free',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

// Widget for each feature item with a checkmark
class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: Colors.teal, // Green checkmark
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(text, style: AppStyle.baseRegular),
        ],
      ),
    );
  }
}

// Widget for billing option buttons
class BillingOption extends StatelessWidget {
  final String title;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const BillingOption({
    super.key,
    required this.title,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.4,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected
                    ? Colors.teal
                    : Colors.grey, // Highlight selected option
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(title, style: AppStyle.headerMedium5),
            const SizedBox(height: 8),
            Text(price, style: AppStyle.baseRegular),
          ],
        ),
      ),
    );
  }
}
