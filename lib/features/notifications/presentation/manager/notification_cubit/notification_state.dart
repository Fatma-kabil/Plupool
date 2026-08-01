import 'package:equatable/equatable.dart';
import 'package:plupool/features/notifications/domain/entities/device_registration_entity.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class RegisterDeviceLoading extends NotificationState {}

class RegisterDeviceSuccess extends NotificationState {
  final DeviceRegistrationEntity device;

  const RegisterDeviceSuccess(this.device);

  @override
  List<Object?> get props => [device];
}

class RegisterDeviceFailure extends NotificationState {
  final String message;

  const RegisterDeviceFailure(this.message);

  @override
  List<Object?> get props => [message];
}