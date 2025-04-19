import 'dart:io';

import 'package:car_pooling/core/helper/prefs_helper.dart';
import 'package:car_pooling/model/carpool_model.dart';
import 'package:car_pooling/model/child_model.dart';
import 'package:car_pooling/model/contact_model.dart';
import 'package:car_pooling/model/spouse_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MenuProfileController extends GetxController {
  // Normal Variables

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController ccvCodeController = TextEditingController();

  // Observable variables
  RxString selectedLanguage = ''.obs;

  RxList<CarpoolModel> myCarPoolHistory = <CarpoolModel>[].obs;
  RxList<ChildModel> myChildrenList = <ChildModel>[].obs;
  RxList<SpouseModel> mySpouseList = <SpouseModel>[].obs;
  RxList<ContactModel> myContactList = <ContactModel>[].obs;
  Rx<File?> profileImage = Rx<File?>(null);
  RxBool homeAddressVisible = false.obs;

  RxString dropDownAddressType = "Home".obs;
  RxString dropDownState = "New York".obs;

  // Account Setting variables
  RxBool isLimitedAccess = true.obs;
  RxString isYearly = "Yearly".obs;
  // Notification of Changes
  RxBool carpoolChanges = false.obs;
  RxBool familyChanges = false.obs;
  RxBool drivingChanges = false.obs;

  // Driving Reminders
  RxBool driving10Min = false.obs;
  RxBool driving1Hour = true.obs;
  RxBool driving24Hours = false.obs;

  // Participation Reminders
  RxBool participation10Min = false.obs;
  RxBool participation1Hour = false.obs;
  RxBool participation24Hours = true.obs;

  // Carpool Notes Notifications
  RxBool notifyNewMessages = false.obs;

  // Live Tracking
  RxBool childPickupDropoff = false.obs;

  // Preferences
  RxBool emailNotifications = false.obs;
  RxBool pushNotifications = false.obs;

  // variables to render on credit card
  RxString cardNumber = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString cvvCode = ''.obs;

  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = File(image.path);
    }
  }

  Future deleteContact() async {
    // Delete contact logic
    Get.defaultDialog(
      title: "Delete Contact",
      middleText: "Are you sure you want to delete this contact?",
      textCancel: "Cancel",
      textConfirm: "Delete",
      confirmTextColor: Colors.white,
      onConfirm: () {
        // Perform delete action here
        Get.back(); // Close the dialog
      },
      onCancel: () {
        Get.back(); // Close the dialog
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();

    final lang = await PrefsHelper.getString(PrefsKey.language);
    if (lang.isNotEmpty) {
      selectedLanguage.value = lang;
      if (lang == "Türkçe") {
        Get.updateLocale(const Locale("tr", "TR"));
      } else {
        Get.updateLocale(const Locale("en", "US"));
      }
    } else {
      selectedLanguage.value = 'English (EN)';
    }
    // Initialize your data or perform any setup here
    fetchCarPoolHistory();
    fetchMyChildrenData();
    fetchMyContactList();
    fetchMySpouseData();
  }

  void fetchCarPoolHistory() {
    // Fetch or initialize your car pool history data
    myCarPoolHistory.addAll([
      // Example data
      CarpoolModel(
        eventName: 'Tech Conference',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREkjvVtzpW8RkeP_aYIE83QD7jlZjWBmVzdqg5snMXdmeB6usoKDTUhD6ahIw6-wF-YthfjWyi-JClxg9-6AlteylvVP1H4t91AYlKSEg',
        fromLocation: 'Downtown Office',
        toLocation: 'Convention Center',
        date: DateTime.now().add(Duration(days: 2)).toString().split(' ')[0],
        time: '09:00',
        canDrive: true,
      ),
      CarpoolModel(
        eventName: 'Weekend Hike',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREkjvVtzpW8RkeP_aYIE83QD7jlZjWBmVzdqg5snMXdmeB6usoKDTUhD6ahIw6-wF-YthfjWyi-JClxg9-6AlteylvVP1H4t91AYlKSEg',
        fromLocation: 'City Center',
        toLocation: 'Mountain Trail',
        date: DateTime.now().add(Duration(days: 5)).toString().split(' ')[0],
        time: '07:30',
        canDrive: false,
      ),
      CarpoolModel(
        eventName: 'Art Exhibition',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREkjvVtzpW8RkeP_aYIE83QD7jlZjWBmVzdqg5snMXdmeB6usoKDTUhD6ahIw6-wF-YthfjWyi-JClxg9-6AlteylvVP1H4t91AYlKSEg',
        fromLocation: 'Residential Area',
        toLocation: 'Art Gallery',
        date: DateTime.now().add(Duration(days: 7)).toString().split(' ')[0],
        time: '14:00',
        canDrive: false,
      ),
      CarpoolModel(
        eventName: 'Sports Event',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREkjvVtzpW8RkeP_aYIE83QD7jlZjWBmVzdqg5snMXdmeB6usoKDTUhD6ahIw6-wF-YthfjWyi-JClxg9-6AlteylvVP1H4t91AYlKSEg',
        fromLocation: 'Suburb A',
        toLocation: 'Stadium',
        date: DateTime.now().add(Duration(days: 10)).toString().split(' ')[0],
        time: '18:00',
        canDrive: true,
      ),
      CarpoolModel(
        eventName: 'Music Festival',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREkjvVtzpW8RkeP_aYIE83QD7jlZjWBmVzdqg5snMXdmeB6usoKDTUhD6ahIw6-wF-YthfjWyi-JClxg9-6AlteylvVP1H4t91AYlKSEg',
        fromLocation: 'Suburb B',
        toLocation: 'Festival Grounds',
        date: DateTime.now().add(Duration(days: 14)).toString().split(' ')[0],
        time: '16:00',
        canDrive: true,
      ),
      CarpoolModel(
        eventName: 'Community Meeting',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREkjvVtzpW8RkeP_aYIE83QD7jlZjWBmVzdqg5snMXdmeB6usoKDTUhD6ahIw6-wF-YthfjWyi-JClxg9-6AlteylvVP1H4t91AYlKSEg',
        fromLocation: 'Local Park',
        toLocation: 'Community Center',
        date: DateTime.now().add(Duration(days: 3)).toString().split(' ')[0],
        time: '19:00',
        canDrive: false,
      ),
      CarpoolModel(
        eventName: 'Book Club',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREkjvVtzpW8RkeP_aYIE83QD7jlZjWBmVzdqg5snMXdmeB6usoKDTUhD6ahIw6-wF-YthfjWyi-JClxg9-6AlteylvVP1H4t91AYlKSEg',
        fromLocation: 'Coffee Shop',
        toLocation: 'Library',
        date: DateTime.now().add(Duration(days: 4)).toString().split(' ')[0],
        time: '15:30',
        canDrive: true,
      ),
    ]);
    myCarPoolHistory.refresh();
  }

  void fetchMyChildrenData() {
    // Dummy data list
    final List<ChildModel> dummyChildren = [
      ChildModel(
        childFistName: 'Emma',
        childLastName: 'Smith',
        fullName: 'Emma Smith',
        childSchoolName: 'Sunny Hill Elementary',
        childPhoto: 'emma_photo.jpg',
        isSelected: false,
      ),
      ChildModel(
        childFistName: 'Liam',
        childLastName: 'Johnson',
        fullName: 'Liam Johnson',
        childSchoolName: 'Maple Grove School',
        childPhoto: 'liam_photo.jpg',
        isSelected: false,
      ),
      ChildModel(
        childFistName: 'Olivia',
        childLastName: 'Brown',
        fullName: 'Olivia Brown',
        childSchoolName: 'Oakwood Academy',
        childPhoto: 'olivia_photo.jpg',
        isSelected: false,
      ),
    ];

    // Add all dummy data to the observable list
    myChildrenList.addAll(dummyChildren);
  }

  void fetchMySpouseData() {
    // Dummy data list
    final List<SpouseModel> dummySpouse = [
      SpouseModel(
        childFistName: 'Jacky',
        childLastName: 'Naila',
        fullName: 'Jacky Naila',
        childSchoolName: 'Sunny Hill Elementary',
        childPhoto: 'emma_photo.jpg',
        isSelected: false,
      ),
    ];

    // Add all dummy data to the observable list
    mySpouseList.addAll(dummySpouse);
  }

  void fetchMyContactList() {
    final List<ContactModel> contacts = [
      ContactModel(
        image:
            "https://example.com/image.jpg", // Replace with a valid image URL
        firstName: "John",
        lastName: "Doe",
        cellNumber: "+1 234 567 8900",
        address: "123 Main St, Springfield",
        distance: "2.5 km",
      ),
      ContactModel(
        firstName: "Jane",
        lastName: "Smith",
        cellNumber: "+1 987 654 3210",
        address: "456 Oak Ave, Rivertown",
        distance: "1.8 km",
      ),
    ];

    myContactList.addAll(contacts);
  }
}
