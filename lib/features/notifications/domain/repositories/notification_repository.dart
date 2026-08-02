import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/notifications/domain/entities/notification_entity.dart';
import 'package:plupool/features/notifications/domain/entities/unread_count_entity.dart';
import '../entities/device_registration_entity.dart';

abstract class NotificationRepository {
  Future<Either<Failure, DeviceRegistrationEntity>> registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  });

  Future<Either<Failure, List<NotificationEntity>>> getNotifications({
    bool? unreadOnly,
    int skip = 0,
    int limit = 100,
  });
  Future<Either<Failure, Unit>> markNotificationAsRead({
    required int notificationId,
  });
  Future<Either<Failure, Unit>> unregisterDevice({required int registrationId});
  Future<Either<Failure, UnreadCountEntity>> getUnreadCount();
}
