import 'notification_push_entity.dart';
import 'sent_notification_entity.dart';

class SendUserNotificationEntity {
  final SentNotificationEntity notification;
  final NotificationPushEntity push;

  const SendUserNotificationEntity({
    required this.notification,
    required this.push,
  });
}