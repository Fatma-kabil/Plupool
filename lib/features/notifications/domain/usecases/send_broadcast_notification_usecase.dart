import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/notifications/domain/entities/send_notification_entity.dart';
import 'package:plupool/features/notifications/domain/repositories/notification_repository.dart';

class SendBroadcastNotificationUseCase {
  final NotificationRepository repository;

  SendBroadcastNotificationUseCase(this.repository);

  Future<Either<Failure, SendNotificationEntity>> call({
    required String title,
    required String message,
    required String type,
    required List<String> roles,
    required Map<String, dynamic> data,
  }) {
    return repository.sendBroadcastNotification(
      title: title,
      message: message,
      type: type,
      roles: roles,
      data: data,
    );
  }
}