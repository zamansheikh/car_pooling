import 'package:car_pooling/model/carpool_invitation_model.dart';
import 'package:car_pooling/model/chat_model.dart';
import 'package:car_pooling/model/contact_model.dart';
import 'package:car_pooling/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  final TextEditingController textController = TextEditingController();

  RxList<ChatModel> myChatLists =
      <ChatModel>[ChatModel(), ChatModel(), ChatModel(), ChatModel()].obs;

  RxList<ContactModel> myContactInvitations =
      <ContactModel>[
        ContactModel(
          address: "4140 Parker Rd. Allentown, New Mexico 31134",
          cellNumber: "+880 178 020 2564",
          distance: "2.5Km",
          firstName: "Dewan Nasif",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe2IhVC1-MwIU4lXET8N6pI-1rzjetYi2ZvQ&s",
        ),
        ContactModel(
          address: "4140 Parker Rd. Allentown, New Mexico 31134",
          cellNumber: "+880 178 020 2564",
          distance: "2.5Km",
          firstName: "Dewan Nasif",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe2IhVC1-MwIU4lXET8N6pI-1rzjetYi2ZvQ&s",
        ),
        ContactModel(
          address: "4140 Parker Rd. Allentown, New Mexico 31134",
          cellNumber: "+880 178 020 2564",
          distance: "2.5Km",
          firstName: "Dewan Nasif",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe2IhVC1-MwIU4lXET8N6pI-1rzjetYi2ZvQ&s",
        ),
      ].obs;

  RxList<CarpoolInvitationModel> myCarpoolInvitations =
      <CarpoolInvitationModel>[
        CarpoolInvitationModel(
          address: "4140 Parker Rd. Allentown, New Mexico 31134",
          cellNumber: "+880 178 020 2564",
          distance: "2.5Km",
          firstName: "Dewan Nasif",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe2IhVC1-MwIU4lXET8N6pI-1rzjetYi2ZvQ&s",
        ),
        CarpoolInvitationModel(
          address: "4140 Parker Rd. Allentown, New Mexico 31134",
          cellNumber: "+880 178 020 2564",
          distance: "2.5Km",
          firstName: "Dewan Nasif",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe2IhVC1-MwIU4lXET8N6pI-1rzjetYi2ZvQ&s",
        ),
        CarpoolInvitationModel(
          address: "4140 Parker Rd. Allentown, New Mexico 31134",
          cellNumber: "+880 178 020 2564",
          distance: "2.5Km",
          firstName: "Dewan Nasif",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe2IhVC1-MwIU4lXET8N6pI-1rzjetYi2ZvQ&s",
        ),
      ].obs;

  RxList<MessageModel> messages = <MessageModel>[].obs;

  void loadInitialMessages() {
    messages.addAll([
      MessageModel(
        isIncoming: true,
        message:
            'Lorem ipsum dolor sit amet conse ctetur, laculis placerat egestas eleif end duis.',
        time: '08:09 PM',
      ),
      MessageModel(
        isIncoming: false,
        message:
            'Lorem ipsum dolor sit amet conse ctetur, laculis placerat egestas eleif end duis.',
        time: '08:09 PM',
        showCheckmark: true,
      ),
      MessageModel(
        isIncoming: true,
        message:
            'Lorem ipsum dolor sit amet conse ctetur, laculis placerat egestas eleif end duis.',
        time: '08:09 PM',
      ),
      MessageModel(
        isIncoming: false,
        message:
            'Lorem ipsum dolor sit amet conse ctetur, laculis placerat egestas eleif end duis.',
        time: '08:09 PM',
        showCheckmark: true,
      ),
    ]);
  }

  void removeMessage(int index) {
    messages.removeAt(index);
  }

  void sendMessage() {
    if (textController.text.isNotEmpty) {
      messages.add(
        MessageModel(
          isIncoming: false,
          message: textController.text,
          time: DateTime.now().toString(),
          showCheckmark: true,
        ),
      );
      textController.clear();
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Load initial messages
    loadInitialMessages();
  }
}
