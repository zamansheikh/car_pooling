class MessageModel {
  final bool isIncoming;
  final String message;
  final String time;
  final bool showCheckmark;
  final String senderName;
  final String image;

  MessageModel({
    required this.isIncoming,
    required this.message,
    required this.time,
    this.showCheckmark = false,
    this.senderName = "Jacob",
    this.image = "",
  });
}
