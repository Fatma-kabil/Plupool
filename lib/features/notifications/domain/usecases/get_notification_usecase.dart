import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/notifications/domain/entities/notification_entity.dart';
import 'package:plupool/features/notifications/domain/repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<Either<Failure, List<NotificationEntity>>> call({
    bool? unreadOnly,
    int skip = 0,
    int limit = 20,
  }) {
    return repository.getNotifications(
      unreadOnly: unreadOnly,
      skip: skip,
      limit: limit,
    );
  }
}