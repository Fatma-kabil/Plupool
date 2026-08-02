import 'package:equatable/equatable.dart';
import 'package:plupool/features/notifications/domain/entities/device_registration_entity.dart';
import 'package:plupool/features/notifications/domain/entities/notification_entity.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

/// ================= Register Device =================

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

/// ================= Get Notifications =================

class GetNotificationsLoading extends NotificationState {}

class GetNotificationsSuccess extends NotificationState {
  final List<NotificationEntity> notifications;

  const GetNotificationsSuccess(this.notifications);

  @override
  List<Object?> get props => [notifications];
}

class GetNotificationsFailure extends NotificationState {
  final String message;

  const GetNotificationsFailure(this.message);

  @override
  List<Object?> get props => [message];
}


class MarkNotificationAsReadLoading extends NotificationState {}

class MarkNotificationAsReadSuccess extends NotificationState {
  final int notificationId;

  const MarkNotificationAsReadSuccess(this.notificationId);

  @override
  List<Object?> get props => [notificationId];
}

class MarkNotificationAsReadFailure extends NotificationState {
  final String message;

  const MarkNotificationAsReadFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class UnregisterDeviceLoading extends NotificationState {}

class UnregisterDeviceSuccess extends NotificationState {}

class UnregisterDeviceFailure extends NotificationState {
  final String message;

  const UnregisterDeviceFailure(this.message);

  @override
  List<Object?> get props => [message];
}