class MessageModel {
  final bool isIncoming;
  final String message;
  final String time;
  final bool showCheckmark;

  MessageModel({
    required this.isIncoming,
    required this.message,
    required this.time,
    this.showCheckmark = false,
  });
}
