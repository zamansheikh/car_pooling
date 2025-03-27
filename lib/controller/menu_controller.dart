import 'dart:io';

import 'package:car_pooling/model/carpool_model.dart';
import 'package:car_pooling/model/child_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MenuProfileController extends GetxController {
  // Normal Variables

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Observable variables
  RxList<CarpoolModel> myCarPoolHistory = <CarpoolModel>[].obs;
  RxList<ChildModel> myChildrenList = <ChildModel>[].obs;
  Rx<File?> profileImage = Rx<File?>(null);
  RxBool homeAddressVisible = false.obs;

  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = File(image.path);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize your data or perform any setup here
    fetchCarPoolHistory();
    fetchMyChildrenData();
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
}
