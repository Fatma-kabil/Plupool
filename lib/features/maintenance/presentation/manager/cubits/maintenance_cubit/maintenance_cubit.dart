import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/maintenance/domain/usecases/get_maintenancr_service_usecase.dart';
import 'maintenance_state.dart';

class MaintenanceCubit extends Cubit<MaintenanceState> {
  final GetMaintenanceServiceUseCase getMaintenanceServiceUseCase;

  MaintenanceCubit(this.getMaintenanceServiceUseCase)
      : super(MaintenanceInitial());

  Future<void> getMaintenanceService() async {
    emit(MaintenanceLoading());

    try {
      final result = await getMaintenanceServiceUseCase();

      emit(MaintenanceLoaded(result));
    }catch (e) {
      if (e is Failure) {
        emit(MaintenanceError(e.message));
      } else {
        emit(MaintenanceError("حدث خطأ اثناء تحميل الخدمة"));
        print(e.toString());
      }
    }
  }
}