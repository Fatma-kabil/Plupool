class SendUserNotificationRequestModel {
  final int userId;
  final String title;
  final String message;
  final String type;
  final Map<String, dynamic> data;

  const SendUserNotificationRequestModel({
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'title': title,
      'message': message,
      'type': type,
      'data': data,
    };
  }
}