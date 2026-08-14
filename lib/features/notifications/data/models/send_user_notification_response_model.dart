import 'package:plupool/features/notifications/domain/entities/notification_push_entity.dart';
import 'package:plupool/features/notifications/domain/entities/send_user_notification_entity.dart';
import 'package:plupool/features/notifications/domain/entities/sent_notification_entity.dart';

class SendUserNotificationResponseModel {
  final NotificationResultModel notification;
  final PushResultModel push;

  const SendUserNotificationResponseModel({
    required this.notification,
    required this.push,
  });

  factory SendUserNotificationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SendUserNotificationResponseModel(
      notification: NotificationResultModel.fromJson(
        json['notification'],
      ),
      push: PushResultModel.fromJson(
        json['push'],
      ),
    );
  }
   SendUserNotificationEntity toEntity() {
    return SendUserNotificationEntity(
      notification: notification.toEntity(),
      push: push.toEntity(),
    );
  }
}

class NotificationResultModel {
  final int id;
  final String title;
  final String message;
  final String type;
  final Map<String, dynamic> data;
  final bool isRead;
  final DateTime createdAt;

  const NotificationResultModel({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.data,
    required this.isRead,
    required this.createdAt,
  });

  factory NotificationResultModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotificationResultModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      type: json['type'],
      data: Map<String, dynamic>.from(
        json['data'] ?? {},
      ),
      isRead: json['is_read'],
      createdAt: DateTime.parse(
        json['created_at'],
      ),
    );
  }
    SentNotificationEntity toEntity() {
    return SentNotificationEntity(
      id: id,
      title: title,
      message: message,
      type: type,
      data: data,
      isRead: isRead,
      createdAt: createdAt,
    );
  }
}

class PushResultModel {
  final int requested;
  final int sent;
  final int failed;
  final int invalidTokens;
  final bool firebaseConfigured;

  const PushResultModel({
    required this.requested,
    required this.sent,
    required this.failed,
    required this.invalidTokens,
    required this.firebaseConfigured,
  });

  factory PushResultModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PushResultModel(
      requested: json['requested'],
      sent: json['sent'],
      failed: json['failed'],
      invalidTokens: json['invalid_tokens'],
      firebaseConfigured: json['firebase_configured'],
    );
  }
  NotificationPushEntity toEntity() {
  return NotificationPushEntity(
    requested: requested,
    sent: sent,
    failed: failed,
    invalidTokens: invalidTokens,
    firebaseConfigured: firebaseConfigured,
  );
}
}