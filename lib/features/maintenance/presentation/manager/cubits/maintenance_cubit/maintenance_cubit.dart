
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_booking_params.dart';
import 'package:plupool/features/maintenance/domain/usecases/book_maintenance_usecase.dart';
import 'package:plupool/features/maintenance/domain/usecases/get_maintenancr_service_usecase.dart';
import 'maintenance_state.dart';

class MaintenanceCubit extends Cubit<MaintenanceState> {
  final GetMaintenanceServiceUseCase getMaintenanceServiceUseCase;
  final BookMaintenanceUseCase bookMaintenanceUseCase;

  MaintenanceCubit(
    this.getMaintenanceServiceUseCase,
    this.bookMaintenanceUseCase,
  ) : super(MaintenanceInitial());

  Future<void> getMaintenanceService() async {
    emit(MaintenanceLoading());

    try {
      final result = await getMaintenanceServiceUseCase();

      emit(MaintenanceLoaded(result));
    } catch (e) {
      if (e is Failure) {
        emit(MaintenanceError(e.message));
      } else {
        emit(
          MaintenanceError(
            "حدث خطأ أثناء تحميل الخدمة",
          ),
        );
      }
    }
  }

  Future<void> bookMaintenance({
    required String bookingType,
    required String bookingDate,
    required String bookingTime,
    int? serviceId,
  }) async {
    emit(MaintenanceBookingLoading());

    try {
      // =========================
      // تنفيذ الحجز
      // =========================
      await bookMaintenanceUseCase(
        MaintenanceBookingEntity(
          bookingType: bookingType,
          bookingDate: bookingDate,
          bookingTime: bookingTime,
          serviceId: serviceId,
        ),
      );

      // =========================
      // الحجز نجح
      // =========================
      emit(MaintenanceBookingSuccess());

      // Refresh للداتا بعد نجاح الحجز
      final service = await getMaintenanceServiceUseCase();

      emit(MaintenanceLoaded(service));
    } catch (e) {
      // =========================
      // الحجز فشل
      // =========================

      String errorMessage;

      if (e is Failure) {
        errorMessage = e.message;
      } else {
        errorMessage = "حدث خطأ أثناء الحجز";
      }

      // Refresh للداتا حتى لو الحجز فشل
      try {
        final service = await getMaintenanceServiceUseCase();

        // نرجع الداتا للشاشة أولاً
        emit(MaintenanceLoaded(service));

        // وبعدها نرسل حالة الخطأ
        emit(MaintenanceBookingError(errorMessage));
      } catch (_) {
        // لو حتى الـ Refresh نفسه فشل
        emit(MaintenanceBookingError(errorMessage));
      }
    }
  }
}
