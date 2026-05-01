import 'package:plupool/features/orders/domain/entities/order_entity.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

/// ==============================
/// LIST STATES
/// ==============================
class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;

  OrdersSuccess(this.orders);
}

class OrdersError extends OrdersState {
  final String message;

  OrdersError(this.message);
}

/// ==============================
/// DETAILS
/// ==============================
class OrderDetailsLoading extends OrdersState {}

class OrderDetailsSuccess extends OrdersState {
  final OrderEntity order;

  OrderDetailsSuccess(this.order);
}

class OrderDetailsError extends OrdersState {
  final String message;

  OrderDetailsError(this.message);
}

/// ==============================
/// DELETE ORDER
/// ==============================
class OrdersDeleting extends OrdersState {}

class OrdersDeleteSuccess extends OrdersState {}

class OrdersDeleteError extends OrdersState {
  final String message;

  OrdersDeleteError(this.message);
}
class OrderUpdateing extends OrdersState {}

class OrderUpdateSuccess extends OrdersState {}

class OrderUpdateError extends OrdersState {
  final String message;

  OrderUpdateError(this.message);
}

/// ==============================
/// ACTIONS (add / update / replace / status)
/// ==============================
class OrdersActionLoading extends OrdersState {}

class OrdersActionSuccess extends OrdersState {}

class OrdersActionError extends OrdersState {
  final String message;

  OrdersActionError(this.message);
}


class OrdersDeleteItemSuccess extends OrdersState {}


