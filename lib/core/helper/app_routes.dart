import 'package:car_pooling/view/auth/sign_in_screen.dart';
import 'package:car_pooling/view/auth/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // =================>>>>>>>>>>>>> Auth Feature <<<<<<<<<<<<<===============
  static String splashScreen = "/splash_screen";
  static String signIn = "/sign_in";

  static List<GetPage> pages = [
    // =================>>>>>>>>>>>>> Auth Feature <<<<<<<<<<<<<===============
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
  ];
}
