import 'package:car_pooling/view/auth/add_child_screen.dart';
import 'package:car_pooling/view/auth/create_new_password_screen.dart';
// import 'package:car_pooling/view/auth/forgot_password_screen.dart';
// import 'package:car_pooling/view/auth/otp_screen.dart';
import 'package:car_pooling/view/auth/sign_in_screen.dart';
import 'package:car_pooling/view/auth/sign_up_screen.dart';
import 'package:car_pooling/view/auth/splash_screen.dart';
import 'package:car_pooling/view/auth/welcome_screen.dart';
import 'package:car_pooling/view/auth/welcome_screen2.dart';
import 'package:car_pooling/view/create_carpool/create_carpool_screen1.dart';
import 'package:car_pooling/view/create_carpool/create_carpool_screen2.dart';
import 'package:car_pooling/view/create_carpool/create_carpool_screen3.dart';
import 'package:car_pooling/view/create_carpool/create_carpool_screen4.dart';
import 'package:get/get.dart';

class AppRoutes {
  // =================>>>>>>>>>>>>> Auth Feature <<<<<<<<<<<<<===============
  static String splashScreen = "/splash_screen";
  static String signIn = "/sign_in";
  static String signUp = "/sign_up";
  static String createNewPass = "/create_new_pass";
  static String addChild = "/add_a_child";
  static String welcomeScreen = "/welcome_screen";
  static String welcomeScreen2 = "/welcome_screen_2";

  // =================>>>>>>>>>>>>> Create carpool <<<<<<<<<<<<<===============
  static String createCarpool1 = "/craete_carpool_1";
  static String createCarpool2 = "/craete_carpool_2";
  static String createCarpool3 = "/craete_carpool_3";
  static String createCarpool4 = "/craete_carpool_4";

  static List<GetPage> pages = [
    // =================>>>>>>>>>>>>> Auth Feature <<<<<<<<<<<<<===============
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: createNewPass, page: () => CreateNewPasswordScreen()),
    GetPage(name: addChild, page: () => AddChildScreen()),
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: welcomeScreen2, page: () => WelcomeScreen2()),

    // =================>>>>>>>>>>>>> Create carpool <<<<<<<<<<<<<===============
    GetPage(name: createCarpool1, page: () => CreateCarpoolScreen1()),
    GetPage(name: createCarpool2, page: () => CreateCarpoolScreen2()),
    GetPage(name: createCarpool3, page: () => CreateCarpoolScreen3()),
    GetPage(name: createCarpool4, page: () => CreateCarpoolScreen4()),
  ];
}
