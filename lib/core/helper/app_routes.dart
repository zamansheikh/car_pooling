import 'package:car_pooling/view/auth/add_child_screen.dart';
import 'package:car_pooling/view/auth/create_new_password_screen.dart';
import 'package:car_pooling/view/auth/forgot_password_screen.dart';
// import 'package:car_pooling/view/auth/otp_screen.dart';
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
  // static String otp = "/otp_screen";
  static String createNewPass = "/create_new_pass";
  static String addChild = "/add_a_child";

  static List<GetPage> pages = [
    // =================>>>>>>>>>>>>> Auth Feature <<<<<<<<<<<<<===============
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    // GetPage(name: otp, page: () => OtpScreen()),
    GetPage(name: createNewPass, page: () => CreateNewPasswordScreen()),
    GetPage(name: addChild, page: () => AddChildScreen()),
  ];
}
