import 'package:car_pooling/model/chat_model.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  RxList<ChatModel> myChatLists =
      <ChatModel>[ChatModel(), ChatModel(), ChatModel(), ChatModel()].obs;
}
