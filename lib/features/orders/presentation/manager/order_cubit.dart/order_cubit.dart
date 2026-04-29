import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/domain/usecases/add_item_to_order_uecase.dart';
import 'package:plupool/features/orders/domain/usecases/delete_item_from_order_usecase.dart';
import 'package:plupool/features/orders/domain/usecases/delete_order_usecase.dart';
import 'package:plupool/features/orders/domain/usecases/get_order_details_usecase.dart';
import 'package:plupool/features/orders/domain/usecases/get_orders_usecase.dart';
import 'package:plupool/features/orders/domain/usecases/replace_order_item_usecase.dart';
import 'package:plupool/features/orders/domain/usecases/update_order_item_usecae.dart';
import 'package:plupool/features/orders/domain/usecases/update_status_usecase.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order%20state.dart';


class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  final GetOrderDetailsUseCase getDetailsUseCase;
  final UpdateOrderStatusUseCase updateStatusUseCase;
  final DeleteOrderUseCase deleteOrderUseCase;
  final AddItemToOrderUseCase addItemUseCase;
  final UpdateOrderItemUseCase updateItemUseCase;
  final DeleteOrderItemUseCase deleteItemUseCase;
  final ReplaceOrderItemUseCase replaceItemUseCase;

  OrdersCubit(
    this.getOrdersUseCase, {
    required this.getDetailsUseCase,
    required this.updateStatusUseCase,
    required this.deleteOrderUseCase,
    required this.addItemUseCase,
    required this.updateItemUseCase,
    required this.deleteItemUseCase,
    required this.replaceItemUseCase,
  }) : super(OrdersInitial());

  /// 🔥 CACHE
  List<OrderEntity> _cachedOrders = [];

  /// 🔥 FILTERS
  String? _status;
  String? _search;

  /// ==============================
  /// 📋 GET ORDERS
  /// ==============================
  Future<void> getOrders({
    int skip = 0,
    int limit = 100,
    String? status,
    String? search,
  }) async {
    emit(OrdersLoading());

    try {
      _status = status;
      _search = search;

      final orders = await getOrdersUseCase(
        skip: skip,
        limit: limit,
        status: status,
        search: search,
      );

      _cachedOrders = orders;

      emit(OrdersSuccess(orders));
    } catch (e) {
      emit(
        OrdersError(
          e is Failure ? e.message : "حدث خطأ أثناء جلب الطلبات",
        ),
       
      );
       print(e);
    }
  }

  /// ==============================
  /// 📄 DETAILS
  /// ==============================
  Future<void> getOrderDetails(int id) async {
    try {
      emit(OrderDetailsLoading());

      final order = await getDetailsUseCase(id);

      emit(OrderDetailsSuccess(order));
    } catch (e) {
      emit(
        OrderDetailsError(
          e is Failure ? e.message : "خطأ في جلب تفاصيل الطلب",
        ),
      );

      /// رجّع الليست
      if (_cachedOrders.isNotEmpty) {
        emit(OrdersSuccess(_cachedOrders));
      }
    }
  }

  /// ==============================
  /// 🗑 DELETE ORDER
  /// ==============================
  Future<void> deleteOrder(int id) async {
    try {
      emit(OrdersDeleting());

      await deleteOrderUseCase(id);

      await refresh();

      emit(OrdersDeleteSuccess());
    } catch (e) {
      emit(
        OrdersDeleteError(
          e is Failure ? e.message : "فشل حذف الطلب",
        ),
      );

      emit(OrdersSuccess(_cachedOrders));
    }
  }

  /// ==============================
  /// 🔄 UPDATE STATUS
  /// ==============================
  Future<void> updateStatus(int id, String status) async {
    try {
      emit(OrdersActionLoading());

      await updateStatusUseCase(id, status);

      await refresh();

      emit(OrdersActionSuccess());
    } catch (e) {
      emit(
        OrdersActionError(
          e is Failure ? e.message : "فشل تغيير الحالة",
        ),
      );

      emit(OrdersSuccess(_cachedOrders));
    }
  }

  /// ==============================
  /// ➕ ADD ITEM
  /// ==============================
  Future<void> addItem({
    required int orderId,
    required int productId,
    required int quantity,
  }) async {
    try {
      emit(OrdersActionLoading());

      await addItemUseCase(
        orderId: orderId,
        productId: productId,
        quantity: quantity,
      );

      await refresh();

      emit(OrdersActionSuccess());
    } catch (e) {
      emit(
        OrdersActionError(
          e is Failure ? e.message : "فشل إضافة المنتج",
        ),
      );

      emit(OrdersSuccess(_cachedOrders));
    }
  }

  /// ==============================
  /// ✏️ UPDATE ITEM
  /// ==============================
  Future<void> updateItem({
    required int orderId,
    required int itemId,
    int? quantity,
    double? price,
  }) async {
    try {
      emit(OrdersActionLoading());

      await updateItemUseCase(
        orderId: orderId,
        itemId: itemId,
        quantity: quantity,
        price: price,
      );

      await refresh();

      emit(OrdersActionSuccess());
    } catch (e) {
      emit(
        OrdersActionError(
          e is Failure ? e.message : "فشل تعديل المنتج",
        ),
      );

      emit(OrdersSuccess(_cachedOrders));
    }
  }

  /// ==============================
  /// ❌ DELETE ITEM
  /// ==============================
  Future<void> deleteItem({
    required int orderId,
    required int itemId,
  }) async {
    try {
      emit(OrdersActionLoading());

      await deleteItemUseCase(
        orderId: orderId,
        itemId: itemId,
      );

      await refresh();

      emit(OrdersActionSuccess());
    } catch (e) {
      emit(
        OrdersActionError(
          e is Failure ? e.message : "فشل حذف المنتج",
        ),
      );

      emit(OrdersSuccess(_cachedOrders));
    }
  }

  /// ==============================
  /// 🔁 REPLACE ITEM
  /// ==============================
  Future<void> replaceItem({
    required int orderId,
    required int itemId,
    required int newProductId,
    int? quantity,
  }) async {
    try {
      emit(OrdersActionLoading());

      await replaceItemUseCase(
        orderId: orderId,
        itemId: itemId,
        newProductId: newProductId,
        quantity: quantity,
      );

      await refresh();

      emit(OrdersActionSuccess());
    } catch (e) {
      emit(
        OrdersActionError(
          e is Failure ? e.message : "فشل استبدال المنتج",
        ),
      );

      emit(OrdersSuccess(_cachedOrders));
    }
  }

  /// ==============================
  /// 🔄 REFRESH
  /// ==============================
  Future<void> refresh() async {
    await getOrders(
      status: _status,
      search: _search,
    );
  }
}