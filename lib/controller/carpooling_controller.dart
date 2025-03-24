import 'package:car_pooling/model/child_model.dart';
import 'package:car_pooling/model/role_model.dart';
import 'package:get/get.dart';

class CarpoolingController extends GetxController {
  RxList<ChildModel> availableChildren =
      <ChildModel>[
        ChildModel(fullName: "Jacob"),
        ChildModel(fullName: "Sofia"),
      ].obs;
  RxList<RoleModel> myRole =
      <RoleModel>[RoleModel(name: "Attend"), RoleModel(name: "Drive")].obs;
}
