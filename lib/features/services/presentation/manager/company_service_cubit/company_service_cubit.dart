import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/services/domain/entities/company_service_entity.dart';
import 'package:plupool/features/services/domain/usecases/get_maintenance_services_use_case.dart';
import 'package:plupool/features/services/domain/usecases/get_services_packages_use_case.dart';


part 'company_service_state.dart';

class CompanyServiceCubit extends Cubit<CompanyServiceState> {
  CompanyServiceCubit(
    this._getMaintenanceServicesUseCase,
    this._getServicesPackagesUseCase,
  ) : super(CompanyServiceInitial());

  final GetMaintenanceServicesUseCase _getMaintenanceServicesUseCase;
  final GetServicesPackagesUseCase _getServicesPackagesUseCase;

  List<CompanyServiceEntity> maintenanceServices = [];
  List<CompanyServiceEntity> servicePackages = [];

  Future<void> getMaintenanceServices({
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) async {
    emit(GetMaintenanceServicesLoading());

    try {
      maintenanceServices =
          await _getMaintenanceServicesUseCase(
        status: status,
        search: search,
        skip: skip,
        limit: limit,
      );

      emit(GetMaintenanceServicesSuccess(maintenanceServices));
    } catch (e) {
      emit(GetMaintenanceServicesFailure(e.toString()));
    }
  }

  Future<void> getServicesPackages({
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) async {
    emit(GetServicesPackagesLoading());

    try {
      servicePackages =
          await _getServicesPackagesUseCase(
        status: status,
        search: search,
        skip: skip,
        limit: limit,
      );

      emit(GetServicesPackagesSuccess(servicePackages));
    
    } catch (e) {
      emit(GetServicesPackagesFailure(e.toString()));
     print(e);
    }
  }
}