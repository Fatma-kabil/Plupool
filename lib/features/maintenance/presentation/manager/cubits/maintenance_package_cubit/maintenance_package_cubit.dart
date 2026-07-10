import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_booking_params.dart';
import 'package:plupool/features/maintenance/domain/usecases/book_maintenance_usecase.dart';
import 'package:plupool/features/maintenance/domain/usecases/get_maintenance_package_usecase.dart';
import 'package:plupool/features/maintenance/presentation/manager/cubits/maintenance_package_cubit/maintenance_packag_state.dart';

class MaintenancePackagesCubit extends Cubit<MaintenancePackagesState> {
  final GetMaintenancePackagesUseCase getMaintenancePackagesUseCase;
  final BookMaintenanceUseCase bookMaintenanceUseCase;

  MaintenancePackagesCubit(
    this.getMaintenancePackagesUseCase,
    this.bookMaintenanceUseCase,
  ) : super(MaintenancePackagesInitial());

  Future<void> getPackages({String? duration}) async {
    emit(MaintenancePackagesLoading());

    try {
      final result = await getMaintenancePackagesUseCase(duration: duration);

      emit(MaintenancePackagesLoaded(result));
    } catch (e) {
      if (e is Failure) {
        emit(MaintenancePackagesError(e.message));
      } else {
        emit(MaintenancePackagesError("حدث خطأ أثناء تحميل الباقات"));
      }
      print(e);
    }
  }

  Future<void> bookPackage({
    required String bookingType,
    required int packageId,
    required String bookingDate,
    required String bookingTime,
  }) async {
    emit(MaintenancePackageBookingLoading());

    try {
      await bookMaintenanceUseCase(
        MaintenanceBookingEntity(
          bookingType: bookingType,
          bookingDate: bookingDate,
          bookingTime: bookingTime,
          packageId: packageId,
        ),
      );

      emit(MaintenancePackageBookingSuccess());

      final packages = await getMaintenancePackagesUseCase();

      emit(MaintenancePackagesLoaded(packages));
    } catch (e) {
      if (e is Failure) {
        emit(MaintenancePackageBookingError(e.message));
      } else {
        emit(MaintenancePackageBookingError("حدث خطأ أثناء الحجز"));
      }
    }
  }
}
