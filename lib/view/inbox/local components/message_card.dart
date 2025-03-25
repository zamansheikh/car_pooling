import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final bool isIncoming;
  final String message;
  final String time;
  final bool showCheckmark;

  const ChatMessage({
    super.key,
    required this.isIncoming,
    required this.message,
    required this.time,
    this.showCheckmark = false,
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
            Text(
              'GF',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
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
                  color: isIncoming ? Colors.grey[200] : Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isIncoming ? Colors.black87 : Colors.white,
                    fontSize: 14,
                  ),
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
