import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/myPool/domain/usecases/get_pool_info_usecse.dart';
import 'package:plupool/features/myPool/presentation/views/manager/pool_info_cubit/pool_info_state.dart';


class PoolInfoCubit extends Cubit<PoolState> {
  final GetPoolInfoUseCase getPoolInfoUseCase;

  PoolInfoCubit(this.getPoolInfoUseCase) : super( PoolState());

  Future<void> getPoolInfo() async {
     print("getPoolInfo called");

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
      ),
    );

    final result = await getPoolInfoUseCase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          ),
        );
      },
      (poolInfo) {
        emit(
          state.copyWith(
            isLoading: false,
            poolInfo: poolInfo,
            errorMessage: null,
          ),
        );
      },
    );
  }
}