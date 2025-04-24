import 'package:car_pooling/controller/inbox_controller.dart';
import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:car_pooling/core/constant/app_colors.dart';
import 'package:car_pooling/view/inbox/local%20components/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});

  final InboxController controller = Get.find<InboxController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: customAppBar1(AppLocalizations.of(context)!.chats ),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                itemCount:
                    controller.messages.length + 1, // +1 for the date header
                itemBuilder: (context, index) {
                  if (index == 0) {
                    final messageIndex = index;
                    final message = controller.messages[messageIndex];
                    // Date Header
                    return Center(
                      child: Text(
                        message.time,
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    );
                  }
                  final messageIndex = index - 1;
                  final message = controller.messages[messageIndex];
                  return GestureDetector(
                    onLongPress: () {
                      // Remove message on long press
                      controller.removeMessage(messageIndex);
                    },
                    child: ChatMessage(
                      image: message.image,
                      name: message.senderName,
                      isIncoming: message.isIncoming,
                      message: message.message,
                      time: message.time,
                      showCheckmark: message.showCheckmark,
                    ),
                  );
                },
              );
            }),
          ),
          // Text Input Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    decoration: InputDecoration(
                      hintText: '${"Message" }...',
                      hintStyle: TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    controller.sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
