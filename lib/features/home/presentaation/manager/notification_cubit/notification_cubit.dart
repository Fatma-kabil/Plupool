import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/home/domain/repos/notification_repo.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository;

  NotificationCubit(this.notificationRepository) : super(NotificationInitial());

  Future<void> fetchNotifications(int userId) async {
    emit(NotificationLoading());

    final failureOrNotifications = await notificationRepository.getNotifications(userId);

    failureOrNotifications.fold(
      (failure) => emit(NotificationError(failure.message)),
      (notifications) => emit(NotificationLoaded(notifications)),
    );
  }
}
