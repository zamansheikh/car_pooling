import 'package:car_pooling/core/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.fullName,
    required this.address,
    required this.image,
    required this.distance,
    required this.addContact,
  });
  final String fullName;
  final String address;
  final String image;
  final String distance;
  final VoidCallback addContact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Adjust width to match the design
      padding: EdgeInsets.all(16), // Padding inside the card
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5), // Light beige/cream background
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 1), // Slight shadow for elevation
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Fit content
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              // TODO: Implement image url function
              CircleAvatar(radius: 32.r),
              SizedBox(width: 12), // Space between image and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Name
                        Text(
                          fullName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // Distance
                        Text(
                          distance,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4), // Space between name and address
                    // Address with location pin
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            address,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16), // Space between text and button
          // Add Contact Button
          CustomButton(buttonTitle: "Add Contact", onTap: addContact),
        ],
      ),
    );
  }
}
