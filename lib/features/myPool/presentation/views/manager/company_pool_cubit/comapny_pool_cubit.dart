import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/myPool/domain/entities/company_pool_entity.dart';
import 'package:plupool/features/myPool/domain/entities/pool_details_entity.dart';
import 'package:plupool/features/myPool/domain/usecases/get_company_pools_use_case.dart';

import 'company_pool_state.dart';
class CompanyPoolCubit extends Cubit<CompanyPoolState> {
  final GetCompanyPoolsUseCase getCompanyPoolsUseCase;

  CompanyPoolCubit(this.getCompanyPoolsUseCase)
      : super(CompanyPoolInitial());

  CompanyPoolEntity? companyPool;
  PoolDetailsEntity? poolDetails;

  bool _poolLoaded = false;
Future<void> getCompanyPools({
  required int clientId,
  String? tab,
  String? bookingType,
  String? status,
  int limit = 100,
}) async {
  // اعرض Loading أول مرة بس
  if (!_poolLoaded) {
    emit(CompanyPoolLoading());
  }

  final result = await getCompanyPoolsUseCase(
    GetCompanyPoolsParams(
      clientId: clientId,
      tab: tab,
      bookingType: bookingType,
      status: status,
      limit: limit,
    ),
  );

 result.fold(
  (failure) => emit(CompanyPoolFailure(failure.message)),
  (data) {
    if (!_poolLoaded) {
      poolDetails = data.poolDetails;
      _poolLoaded = true;
    }

    companyPool = CompanyPoolEntity(
      total: data.total,
      filteredCount: data.filteredCount,
      returned: data.returned,
      limit: data.limit,
      stats: data.stats,
      items: data.items,
      client: data.client,
      poolDetails: poolDetails, // <-- استخدمي المخزنة
      notesTotal: data.notesTotal,
      notes: data.notes,
    );

    emit(CompanyPoolSuccess(companyPool!));
  },
);
}
}