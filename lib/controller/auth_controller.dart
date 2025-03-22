import 'dart:async';

import 'package:car_pooling/core/components/show_custom_snackbar.dart';
import 'package:car_pooling/core/helper/app_routes.dart';
import 'package:car_pooling/view/auth/otp_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // =================>>>>>>>>>>>>> Normal Variables <<<<<<<<<<<<<===============

  Timer? timer;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  // =================>>>>>>>>>>>>> RX variables <<<<<<<<<<<<<===============
  RxBool isLoading = false.obs;
  RxBool checkBoxStatus = false.obs;
  RxInt secondsRemaining = 59.obs; // Timer duration
  RxBool isTimerActive = false.obs;

  // =================>>>>>>>>>>>>> Functions <<<<<<<<<<<<<===============
  Future userSignIn(formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final body = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    debugPrint("=========>>>>>>>>>>>>> userSignIn: $body");

    showCustomSnackBar("User Signed in successfully", isError: false);
  }

  Future userSignUp(formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!checkBoxStatus.value) {
      showCustomSnackBar(
        "You must agree to the terms and conditions to continue",
        isError: true,
      );
      return;
    }

    final body = {
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };

    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    debugPrint("=========>>>>>>>>>>>>> userSignIn: $body");

    showCustomSnackBar("User created successfully", isError: false);
  }

  Future userGetOTP(formKey, {isPhone, isReset}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (isPhone && phoneController.text.length < 4) {
      showCustomSnackBar("Enter Number");
      return;
    }

    final body = {
      if (isPhone)
        "phone": phoneController.text
      else
        "email": emailController.text,
    };

    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    debugPrint("=========>>>>>>>>>>>>> userSignIn: $body");

    Get.to(
      OtpScreen(
        isReset: isReset,
        sendTo: isPhone ? phoneController.text : emailController.text,
      ),
    );

    showCustomSnackBar("OTP sent successfully", isError: false);
  }

  Future resendOTP(sendTo) async {
    //  Start timer
    if (!isTimerActive.value) {
      isTimerActive.value = true;
      secondsRemaining.value = 59;

      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        debugPrint("=========>>>>>>>>>>> Timer: $timer");
        if (secondsRemaining > 0) {
          secondsRemaining.value--;
        } else {
          isTimerActive.value = false;
          timer.cancel();
        }
      });
    }
    // Prepare the body and hit api
    final body = {"sendTo": sendTo};
    debugPrint("=========>>>>>>>>>>>>> userSignIn: $body");
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    showCustomSnackBar("OTP Rsend to $sendTo", isError: false);
  }

  Future confirmOTP({sendTo, isReset}) async {
    if (otpController.text.length < 4) {
      showCustomSnackBar("Eter otp");
      return;
    }
    final body = {"otp": int.parse(otpController.text), "sendTo": sendTo};
    debugPrint("=========>>>>>>>>>>>>> userSignIn: $body");
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    if (isReset) Get.toNamed(AppRoutes.createNewPass);

    showCustomSnackBar("OTP Confirmed", isError: false);
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    otpController.clear();
    super.dispose();
  }
}
