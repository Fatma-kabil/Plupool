
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_booking_params.dart';
import 'package:plupool/features/maintenance/domain/usecases/book_maintenance_usecase.dart';
import 'package:plupool/features/maintenance/domain/usecases/get_maintenance_package_usecase.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_package_cubit/maintenance_packag_state.dart';

class MaintenancePackagesCubit
    extends Cubit<MaintenancePackagesState> {
  final GetMaintenancePackagesUseCase getMaintenancePackagesUseCase;
  final BookMaintenanceUseCase bookMaintenanceUseCase;

  MaintenancePackagesCubit(
    this.getMaintenancePackagesUseCase,
    this.bookMaintenanceUseCase,
  ) : super(MaintenancePackagesInitial());

  // آخر duration مستخدم في جلب الباقات
  String? _lastDuration;

  // =========================
  // Get Packages
  // =========================
  Future<void> getPackages({String? duration}) async {
    // نحفظ الـ duration
    _lastDuration = duration;

    emit(MaintenancePackagesLoading());

    try {
      final result = await getMaintenancePackagesUseCase(
        duration: duration,
      );

      emit(MaintenancePackagesLoaded(result));
    } catch (e) {
      if (e is Failure) {
        emit(MaintenancePackagesError(e.message));
      } else {
        emit(
          MaintenancePackagesError(
            "حدث خطأ أثناء تحميل الباقات",
          ),
        );
      }

      print(e);
    }
  }

  // =========================
  // Refresh Packages
  // =========================
  Future<void> refreshPackages() async {
    try {
      final packages = await getMaintenancePackagesUseCase(
        duration: _lastDuration,
      );

      emit(MaintenancePackagesLoaded(packages));
    } catch (e) {
      if (e is Failure) {
        emit(MaintenancePackagesError(e.message));
      } else {
        emit(
          MaintenancePackagesError(
            "حدث خطأ أثناء تحديث الباقات",
          ),
        );
      }
    }
  }

  // =========================
  // Book Package
  // =========================
  Future<void> bookPackage({
    required String bookingType,
    required int packageId,
    required String bookingDate,
    required String bookingTime,
  }) async {
    emit(MaintenancePackageBookingLoading());

    try {
      // تنفيذ الحجز
      await bookMaintenanceUseCase(
        MaintenanceBookingEntity(
          bookingType: bookingType,
          bookingDate: bookingDate,
          bookingTime: bookingTime,
          packageId: packageId,
        ),
      );

      // الحجز نجح
      emit(MaintenancePackageBookingSuccess());

      // Refresh بنفس duration اللي كانت مفتوحة
      await refreshPackages();
    } catch (e) {
      String errorMessage;

      if (e is Failure) {
        errorMessage = e.message;
      } else {
        errorMessage = "حدث خطأ أثناء الحجز";
      }

      // الحجز فشل → نعمل Refresh برضه
      await refreshPackages();

      // نبلغ الـ UI إن الحجز فشل
      emit(
        MaintenancePackageBookingError(errorMessage),
      );
    }
  }
}
