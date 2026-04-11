import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/domain/usecases/get_store_statistics_usecase.dart';
import 'store_statistics_state.dart';

class StoreStatisticsCubit extends Cubit<StoreStatisticsState> {
  final GetStoreStatisticsUseCase getStoreStatisticsUseCase;

  StoreStatisticsCubit(this.getStoreStatisticsUseCase)
    : super(StoreStatisticsInitial());

  Future<void> getStoreStatistics() async {
    emit(StoreStatisticsLoading());

    try {
      final data = await getStoreStatisticsUseCase();
      emit(StoreStatisticsSuccess(data));
    } catch (e) {
      if (e is Failure) {
        emit(StoreStatisticsError(e.message));
      } else {
        emit(StoreStatisticsError(e.toString()));
      }
    }
  }
}
