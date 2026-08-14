import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/notifications/domain/entities/send_user_notification_entity.dart';
import 'package:plupool/features/notifications/domain/repositories/notification_repository.dart';

class SendNotificationToUserUseCase {
  final NotificationRepository repository;

  SendNotificationToUserUseCase(this.repository);

  Future<Either<Failure, SendUserNotificationEntity>> call({
    required int userId,
    required String title,
    required String message,
    required String type,
    required Map<String, dynamic> data,
  }) {
    return repository.sendNotificationToUser(
      userId: userId,
      title: title,
      message: message,
      type: type,
      data: data,
    );
  }
}