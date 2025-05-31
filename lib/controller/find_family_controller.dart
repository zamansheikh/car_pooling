import 'package:car_pooling/model/contact_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FindFamilyController extends GetxController {
  TextEditingController familySearchController = TextEditingController();

  RxList<ContactModel> myContacts =
      <ContactModel>[
        ContactModel(
          id: "01",
          address: "4140 Parker Rd. Allentown, New Mexico 31134",
          cellNumber: "+880 199 2670 456",
          distance: "1.5km",
          firstName: "Adam",
          lastName: "brown",
        ),
        ContactModel(
          id: "02",
          address: "4140 Parker Rd. Allentown, New Mexico 31134",
          cellNumber: "+880 199 2670 456",
          distance: "1.5km",
          firstName: "Adam",
          lastName: "brown",
        ),
      ].obs;
}
