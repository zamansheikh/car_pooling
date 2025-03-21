import 'package:car_pooling/view/auth/forgot_password_screen.dart';
import 'package:car_pooling/view/auth/sign_in_screen.dart';
import 'package:car_pooling/view/auth/sign_up_screen.dart';
import 'package:car_pooling/view/auth/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // =================>>>>>>>>>>>>> Auth Feature <<<<<<<<<<<<<===============
  static String splashScreen = "/splash_screen";
  static String signIn = "/sign_in";
  static String signUp = "/sign_up";
  static String forgotPassword = "/forgot_pass";

  static List<GetPage> pages = [
    // =================>>>>>>>>>>>>> Auth Feature <<<<<<<<<<<<<===============
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
  ];
}
