import 'package:car_pooling/core/components/show_custom_snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // =================>>>>>>>>>>>>> Normal Variables <<<<<<<<<<<<<===============
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  // =================>>>>>>>>>>>>> RX variables <<<<<<<<<<<<<===============
  RxBool isLoading = false.obs;
  RxBool checkBoxStatus = false.obs;

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

    showCustomSnackBar("User Signed in successfully", isError: false);
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    super.dispose();
  }
}
