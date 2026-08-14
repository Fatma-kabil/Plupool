import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:plupool/features/notifications/data/models/send_notification_request_model.dart';
import 'package:plupool/features/notifications/data/models/send_user_notification_request_model.dart';
import 'package:plupool/features/notifications/domain/entities/device_registration_entity.dart';
import 'package:plupool/features/notifications/domain/entities/notification_entity.dart';
import 'package:plupool/features/notifications/domain/entities/send_notification_entity.dart';
import 'package:plupool/features/notifications/domain/entities/send_user_notification_entity.dart';
import 'package:plupool/features/notifications/domain/entities/unread_count_entity.dart';
import 'package:plupool/features/notifications/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, DeviceRegistrationEntity>> registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  }) async {
    try {
      final result = await remoteDataSource.registerDevice(
        token: token,
        platform: platform,
        deviceId: deviceId,
      );

      return Right(result);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications({
    bool? unreadOnly,
    int skip = 0,
    int limit = 20,
  }) async {
    try {
      final result = await remoteDataSource.getNotifications(
        unreadOnly: unreadOnly,
        skip: skip,
        limit: limit,
      );

      return Right(result);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> markNotificationAsRead({
    required int notificationId,
  }) async {
    try {
      await remoteDataSource.markNotificationAsRead(
        notificationId: notificationId,
      );

      return const Right(unit);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> unregisterDevice({
    required int registrationId,
  }) async {
    try {
      await remoteDataSource.unregisterDevice(registrationId: registrationId);

      return right(unit);
    } catch (e) {
      return left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, UnreadCountEntity>> getUnreadCount() async {
    try {
      final unreadCount = await remoteDataSource.getUnreadCount();

      return right(unreadCount);
    } catch (e) {
      return left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, SendNotificationEntity>> sendBroadcastNotification({
    required String title,
    required String message,
    required String type,
    required List<String> roles,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await remoteDataSource.sendBroadcastNotification(
        SendNotificationRequestModel(
          title: title,
          message: message,
          type: type,
          roles: roles,
          data: data,
        ),
      );

      return Right(response);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, SendUserNotificationEntity>> sendNotificationToUser({
    required int userId,
    required String title,
    required String message,
    required String type,
    required Map<String, dynamic> data,
  }) async {
    try {
      final request = SendUserNotificationRequestModel(
        userId: userId,
        title: title,
        message: message,
        type: type,
        data: data,
      );

      final response = await remoteDataSource.sendNotificationToUser(request);

      return Right(response.toEntity());
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
}
