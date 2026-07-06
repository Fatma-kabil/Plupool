import 'package:equatable/equatable.dart';
import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';

enum StoreOrdersStatus {
  initial,
  loading,
  success,
  failure,
}

class StoreOrdersState extends Equatable {
  final StoreOrdersStatus status;
  final List<StoreOrderEntity> orders;
  final String errorMessage;

  const StoreOrdersState({
    this.status = StoreOrdersStatus.initial,
    this.orders = const [],
    this.errorMessage = '',
  });

  StoreOrdersState copyWith({
    StoreOrdersStatus? status,
    List<StoreOrderEntity>? orders,
    String? errorMessage,
  }) {
    return StoreOrdersState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        orders,
        errorMessage,
      ];
}