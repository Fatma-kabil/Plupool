import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/services/local_storage_service.dart';
import 'package:plupool/core/services/notification_service.dart';
import 'package:plupool/features/notifications/domain/usecases/get_notification_usecase.dart';
import 'package:plupool/features/notifications/domain/usecases/get_unread_count_usecase.dart';
import 'package:plupool/features/notifications/domain/usecases/mark_notification_as_read_usecase.dart';
import 'package:plupool/features/notifications/domain/usecases/register_device_use_case.dart';
import 'package:plupool/features/notifications/domain/usecases/unregister_device_usecae.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final RegisterDeviceUseCase registerDeviceUseCase;
  final GetNotificationsUseCase getNotificationsUseCase;
  final MarkNotificationAsReadUseCase markNotificationAsReadUseCase;
  final UnregisterDeviceUseCase unregisterDeviceUseCase;
  final GetUnreadCountUseCase getUnreadCountUseCase;

  NotificationCubit(
    this.registerDeviceUseCase,
    this.getNotificationsUseCase,
    this.markNotificationAsReadUseCase,
    this.unregisterDeviceUseCase,
    this.getUnreadCountUseCase,
  ) : super(NotificationInitial());

  /// ================= Register Device =================

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

    result.fold((failure) => emit(RegisterDeviceFailure(failure.message)), (
      device,
    ) async {
      await LocalStorageService.saveNotificationRegistrationId(device.id);

      emit(RegisterDeviceSuccess(device));

      await getUnreadCount();
    });
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

  /// ================= Get Notifications =================

  Future<void> getNotifications({
    bool? unreadOnly,
    int skip = 0,
    int limit = 20,
  }) async {
    emit(GetNotificationsLoading());

    final result = await getNotificationsUseCase(
      unreadOnly: unreadOnly,
      skip: skip,
      limit: limit,
    );

    result.fold(
      (failure) => emit(GetNotificationsFailure(failure.message)),
      (notifications) => emit(GetNotificationsSuccess(notifications)),
    );
  }

  /// ================= Get Unread Count =================
  int unreadCount = 0;

  Future<void> getUnreadCount() async {
    final result = await getUnreadCountUseCase();

    result.fold((failure) => emit(GetUnreadCountFailure(failure.message)), (
      count,
    ) {
      unreadCount = count.unreadCount;
      emit(GetUnreadCountSuccess(count));
    });
  }

  /// ================= Mark Notification As Read =================

  Future<void> markNotificationAsRead(int notificationId) async {
    final result = await markNotificationAsReadUseCase(
      notificationId: notificationId,
    );

    result.fold((failure) {}, (_) async {
      await Future.wait([getNotifications(), getUnreadCount()]);
    });
  }

  /// ================= Unregister Device =================

  Future<void> unregisterDevice({required int registrationId}) async {
    emit(UnregisterDeviceLoading());

    final result = await unregisterDeviceUseCase(
      registrationId: registrationId,
    );

    result.fold((failure) => emit(UnregisterDeviceFailure(failure.message)), (
      _,
    ) async {
      await LocalStorageService.removeNotificationRegistrationId();
      emit(UnregisterDeviceSuccess());
    });
  }
}
