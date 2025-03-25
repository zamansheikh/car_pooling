import 'package:car_pooling/model/carpool_model.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  RxList<CarpoolModel> carpoolList =
      <CarpoolModel>[CarpoolModel(), CarpoolModel(), CarpoolModel()].obs;
}
