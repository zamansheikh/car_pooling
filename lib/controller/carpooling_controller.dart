import 'package:car_pooling/model/child_model.dart';
import 'package:car_pooling/model/contact_model.dart';
import 'package:car_pooling/model/role_model.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CarpoolingController extends GetxController {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController startLocationController = TextEditingController();
  TextEditingController endLocationController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController searchContactController = TextEditingController();
  TextEditingController addMessageController = TextEditingController();

  RxList<ChildModel> availableChildren =
      <ChildModel>[
        ChildModel(fullName: "Jacob"),
        ChildModel(fullName: "Sofia"),
      ].obs;
  RxList<RoleModel> myRole =
      <RoleModel>[RoleModel(name: "Attend"), RoleModel(name: "Drive")].obs;

  RxList<ContactModel> myContact =
      <ContactModel>[
        ContactModel(
          firstName: "Adam",
          lastName: "Brown",
          cellNumber: "+880 178 020 2564",
        ),
        ContactModel(
          firstName: "Adam",
          lastName: "Brown",
          cellNumber: "+880 178 020 2564",
        ),
      ].obs;

  RxString selectedOption = "Custom".obs;
  RxBool isReturnTrip = false.obs;
  final Rx<Time> timePicker =
      Time(hour: DateTime.now().hour, minute: DateTime.now().minute).obs;

  final List<String> availableOptions = [
    "Does not repeat",
    "Daily",
    "Every week",
    "Custom",
  ];

  void clearController() {
    eventNameController.clear();
    endLocationController.clear();
    startLocationController.clear();
    returnDateController.clear();
    searchContactController.clear();
    addMessageController.clear();
  }

  @override
  void onClose() {
    clearController();
    super.onClose();
  }
}
