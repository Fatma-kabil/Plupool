import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/notifications/domain/entities/device_registration_entity.dart';
import 'package:plupool/features/notifications/domain/repositories/notification_repository.dart';

class RegisterDeviceUseCase {
  final NotificationRepository repository;

  RegisterDeviceUseCase(this.repository);

  Future<Either<Failure, DeviceRegistrationEntity>> call({
    required String token,
    required String platform,
    required String deviceId,
  }) {
    return repository.registerDevice(
      token: token,
      platform: platform,
      deviceId: deviceId,
    );
  }
}