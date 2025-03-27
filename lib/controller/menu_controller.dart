import 'package:car_pooling/model/carpool_model.dart';
import 'package:get/get.dart';

class MenuProfileController extends GetxController {
  RxList<CarpoolModel> myCarPoolHistory = <CarpoolModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize your data or perform any setup here
    fetchCarPoolHistory();
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
}
