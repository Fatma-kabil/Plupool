class SendNotificationRequestModel {
  final String title;
  final String message;
  final String type;
  final List<String> roles;
  final Map<String, dynamic> data;

  const SendNotificationRequestModel({
    required this.title,
    required this.message,
    required this.type,
    required this.roles,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "message": message,
      "type": type,
      "roles": roles,
      "data": data,
    };
  }
}