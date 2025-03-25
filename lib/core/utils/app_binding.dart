import 'package:car_pooling/controller/auth_controller.dart';
import 'package:car_pooling/controller/carpooling_controller.dart';
import 'package:car_pooling/controller/find_family_controller.dart';
import 'package:car_pooling/controller/inbox_controller.dart';
import 'package:car_pooling/controller/schedule_controller.dart';
import 'package:get/get.dart';

class AppBindings {
  static Bindings bindings = BindingsBuilder(() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => CarpoolingController(), fenix: true);
    Get.lazyPut(() => FindFamilyController(), fenix: true);
    Get.lazyPut(() => ScheduleController(), fenix: true);
    Get.lazyPut(() => InboxController(), fenix: true);
  });
}
