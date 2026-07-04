import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/consruction_service/domain/usecases/get_pool_types_usecase.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/pool_types_cubit/pool_types_state.dart';

class PoolTypesCubit extends Cubit<PoolTypesState> {
  PoolTypesCubit(this.getPoolTypesUseCase)
      : super(PoolTypesInitial());

  final GetPoolTypesUseCase getPoolTypesUseCase;

  Future<void> getPoolTypes() async {
    emit(PoolTypesLoading());

    final result = await getPoolTypesUseCase();

    result.fold(
      (failure) => emit(PoolTypesFailure(failure.message)),
      (poolTypes) => emit(PoolTypesSuccess(poolTypes)),
    );
  }
}