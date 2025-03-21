import 'package:car_pooling/controller/auth_controller.dart';
import 'package:get/get.dart';

class AppBindings {
  static Bindings bindings = BindingsBuilder(() {
    Get.lazyPut(() => AuthController(), fenix: true);
  });
}
