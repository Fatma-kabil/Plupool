import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/notifications/domain/repositories/notification_repository.dart';

class UnregisterDeviceUseCase {
  final NotificationRepository repository;

  UnregisterDeviceUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required int registrationId,
  }) {
    return repository.unregisterDevice(
      registrationId: registrationId,
    );
  }
}