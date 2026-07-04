import 'package:equatable/equatable.dart';
import 'package:plupool/features/myPool/domain/entities/pool_info_entity.dart';

class PoolState extends Equatable {
  final bool isLoading;
  final PoolInfoEntity? poolInfo;
  final String? errorMessage;

  const PoolState({
    this.isLoading = false,
    this.poolInfo,
    this.errorMessage,
  });

  PoolState copyWith({
    bool? isLoading,
    PoolInfoEntity? poolInfo,
    String? errorMessage,
  }) {
    return PoolState(
      isLoading: isLoading ?? this.isLoading,
      poolInfo: poolInfo ?? this.poolInfo,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        poolInfo,
        errorMessage,
      ];
}