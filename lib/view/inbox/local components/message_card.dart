import 'package:car_pooling/core/components/image_renderer.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final bool isIncoming;
  final String message;
  final String time;
  final bool showCheckmark;
  final String name;
  final String image;

  const ChatMessage({
    super.key,
    required this.isIncoming,
    required this.message,
    required this.time,
    this.showCheckmark = false,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isIncoming ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isIncoming) ...[
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.background, // Placeholder color
              child:
                  image == ''
                      ? Text(name[0], style: AppStyle.largeMedium)
                      : imageRenderer(url: image, borderRadius: 100, size: 30),
            ),
            SizedBox(width: 8),
          ],
          Column(
            crossAxisAlignment:
                isIncoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment:
                    isIncoming
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  if (showCheckmark) ...[
                    SizedBox(width: 4),
                    Icon(Icons.check, size: 14, color: Colors.black54),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
