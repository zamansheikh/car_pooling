import 'package:flutter/material.dart';

class CarpoolModel {
  final String eventName;
  final String image;
  final String fromLocation;
  final String toLocation;
  final String date;
  final String startTime;
  final String estimatedEndTime;
  final bool canDrive;

  CarpoolModel({
    this.eventName = 'Unnamed Event',
    this.image = '',
    this.fromLocation = 'Unknown Location',
    this.toLocation = 'Unknown Destination',
    this.canDrive = false,
    String? date,
    String? startTime,
    String? estimatedEndTime,
  }) : date = date ?? DateTime.now().toString(),
       startTime =
           startTime ?? '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}',
       estimatedEndTime =
           estimatedEndTime ??
           '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}';
}
