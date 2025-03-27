import 'package:car_pooling/controller/menu_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/components/custom_button.dart';
import 'package:car_pooling/core/components/custom_date_input.dart';
import 'package:car_pooling/core/components/custom_input_field.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});
  final MenuProfileController controller = Get.find<MenuProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1("Payment"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          spacing: 16.h,
          children: [
            Obx(() {
              return CreditCardWidget(
                cardBgColor: AppColors.primaryDark,
                obscureCardCvv: false,
                obscureCardNumber: false,
                obscureInitialCardNumber: false,
                cardNumber:
                    controller.cardNumber.value, // Valid Visa test card number
                expiryDate:
                    controller.expiryDate.value, // Future date (December 2026)
                cardHolderName:
                    controller.cardHolderName.value, // Dummy cardholder name
                cvvCode: controller.cvvCode.value, // Dummy CVV code
                showBackView:
                    false, // Set to false to show the front view (default)
                onCreditCardWidgetChange: (CreditCardBrand brand) {
                  // Callback to handle card brand changes (e.g., Visa, Mastercard)
                  print("Card brand changed to: ${brand.brandName}");
                },
              );
            }),

            CustomInputField(
              controller: controller.cardHolderNameController,
              hintText: "Card Holder Name",
              onChanged: (p0) {
                controller.cardHolderName.value = p0;
              },
            ),
            CustomInputField(
              isNumber: true,
              controller: controller.cardNumberController,
              hintText: "Card Number",
              onChanged: (p0) {
                controller.cardNumber.value = p0;
              },
            ),
            Row(
              spacing: 16.w,
              children: [
                Flexible(
                  child: CustomDateInput(
                    dateController: controller.expiryDateController,
                    hintText: "Expiry Date",
                    onChanged: (p0) {
                      controller.expiryDate.value = p0;
                    },
                  ),
                ),

                Flexible(
                  child: CustomInputField(
                    isNumber: true,
                    controller: controller.ccvCodeController,
                    hintText: "CCV Code",
                    onChanged: (p0) {
                      controller.cvvCode.value = p0;
                    },
                  ),
                ),
              ],
            ),
            CustomButton(buttonTitle: "Update", onTap: () {}),
          ],
        ),
      ),
    );
  }
}

// Widget for the Credit Card UI
