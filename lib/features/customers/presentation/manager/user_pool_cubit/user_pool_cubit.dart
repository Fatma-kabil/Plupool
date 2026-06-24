import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/customers/domain/usecases/get_user_pool_usecase.dart';
import 'package:plupool/features/customers/domain/usecases/update_user_pool_usecase.dart';
import 'package:plupool/features/customers/presentation/manager/user_pool_cubit/user_pool_state.dart';

class PoolCubit extends Cubit<PoolState> {
  final GetUserPoolUseCase getUserPoolUseCase;
  final UpdateUserPoolUseCase updateUserPoolUseCase;

  PoolCubit(this.getUserPoolUseCase, this.updateUserPoolUseCase)
    : super(PoolState());

  Future<void> getPool(int userId) async {
    emit(state.copyWith(isLoading: true));

    try {
      final data = await getUserPoolUseCase(userId);
      emit(state.copyWith(isLoading: false, data: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
      print(e);
    }
  }

  Future<void> updatePool(int userId, Map<String, dynamic> body) async {
    emit(state.copyWith(isUpdating: true));

    try {
      final data = await updateUserPoolUseCase(userId: userId, body: body);

      emit(state.copyWith(isUpdating: false, data: data));
    } catch (e) {
      emit(state.copyWith(isUpdating: false, error: e.toString()));
    }
  }
}
