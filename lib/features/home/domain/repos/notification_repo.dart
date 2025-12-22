import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';

import '../entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications(int userId);
}
