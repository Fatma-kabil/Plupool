import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/notifications/domain/entities/unread_count_entity.dart';
import 'package:plupool/features/notifications/domain/repositories/notification_repository.dart';

class GetUnreadCountUseCase {
  final NotificationRepository repository;

  GetUnreadCountUseCase(this.repository);

  Future<Either<Failure, UnreadCountEntity>> call() {
    return repository.getUnreadCount();
  }
}