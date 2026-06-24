
import 'package:plupool/features/customers/domain/entities/user_pool_entity.dart';

class PoolState {
  final bool isLoading;
  final bool isUpdating;
  final UserPoolEntity? data;
  final String? error;

  PoolState({
    this.isLoading = false,
    this.isUpdating = false,
    this.data,
    this.error,
  });

  PoolState copyWith({
    bool? isLoading,
    bool? isUpdating,
    UserPoolEntity? data,
    String? error,
  }) {
    return PoolState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      data: data ?? this.data,
      error: error,
    );
  }
}
