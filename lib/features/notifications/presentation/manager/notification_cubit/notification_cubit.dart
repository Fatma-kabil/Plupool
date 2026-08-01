import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/services/notification_service.dart';
import 'package:plupool/features/notifications/domain/usecases/register_device_use_case.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final RegisterDeviceUseCase registerDeviceUseCase;

  NotificationCubit(this.registerDeviceUseCase)
      : super(NotificationInitial());

  Future<void> registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  }) async {
    emit(RegisterDeviceLoading());

    final result = await registerDeviceUseCase(
      token: token,
      platform: platform,
      deviceId: deviceId,
    );

    result.fold(
      (failure) => emit(RegisterDeviceFailure(failure.message)),
      (device) => emit(RegisterDeviceSuccess(device)),
    );
  }

  Future<void> registerCurrentDevice() async {
    final notificationService = NotificationService.instance;

    final fcmToken = await notificationService.getFcmToken();

    if (fcmToken == null) return;

    final deviceId = await notificationService.getDeviceId();

    await registerDevice(
      token: fcmToken,
      platform: notificationService.platform,
      deviceId: deviceId,
    );
  }
}