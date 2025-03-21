import 'package:car_pooling/core/components/show_custom_snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // =================>>>>>>>>>>>>> Normal Variables <<<<<<<<<<<<<===============
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // =================>>>>>>>>>>>>> RX variables <<<<<<<<<<<<<===============
  RxBool isLoading = false.obs;
  RxBool checkBoxStatus = false.obs;

  // =================>>>>>>>>>>>>> Functions <<<<<<<<<<<<<===============
  Future userSignIn() async {
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
