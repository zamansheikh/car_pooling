import 'package:flutter/material.dart';

class CarpoolModel {
  final String eventName;
  final String image;
  final String fromLocation;
  final String toLocation;
  final String date;
  final String time;
  final bool canDrive;

  CarpoolModel({
    this.eventName = 'Unnamed Event',
    this.image = '',
    this.fromLocation = 'Unknown Location',
    this.toLocation = 'Unknown Destination',
    this.canDrive = false,
    String? date,
    String? time,
  }) : date = date ?? DateTime.now().toString(),
       time = time ?? '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}';
}
