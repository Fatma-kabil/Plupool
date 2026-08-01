import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import '../entities/device_registration_entity.dart';

abstract class NotificationRepository {
  Future<Either<Failure, DeviceRegistrationEntity>> registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  });
}