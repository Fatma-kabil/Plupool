import 'package:bloc/bloc.dart';
import 'package:plupool/features/tasks/domain/usecases/get_technician_services_usecase.dart';
import 'package:plupool/features/tasks/presentation/views/manager/technician_services_cubit/technician_services_state.dart';

class TechnicianServicesCubit extends Cubit<TechnicianServicesState> {
  TechnicianServicesCubit(this._getTechnicianServicesUseCase)
      : super(TechnicianServicesInitial());

  final GetTechnicianServicesUseCase _getTechnicianServicesUseCase;

  Future<void> getTechnicianServices({
    required int clientId,
    String? status,
  }) async {
    emit(GetTechnicianServicesLoading());

    final result = await _getTechnicianServicesUseCase(
      clientId: clientId,
      status: status,
    );

    result.fold(
      (failure) =>
          emit(GetTechnicianServicesFailure(failure.message)),
      (data) =>
          emit(GetTechnicianServicesSuccess(data)),
    );
  }
}