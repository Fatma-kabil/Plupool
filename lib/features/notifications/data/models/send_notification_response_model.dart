import '../../domain/entities/send_notification_entity.dart';

class SendNotificationResponseModel extends SendNotificationEntity {
  const SendNotificationResponseModel({
    required super.recipients,
    required super.requested,
    required super.sent,
    required super.failed,
  });

  factory SendNotificationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SendNotificationResponseModel(
      recipients: json["recipients"] ?? 0,
      requested: json["requested"] ?? 0,
      sent: json["sent"] ?? 0,
      failed: json["failed"] ?? 0,
    );
  }
}