import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/data/models/cart_count_model.dart';
import 'package:plupool/features/store/data/models/cart_model.dart';
import 'package:plupool/features/store/data/models/confirm_order_request_model.dart';
import 'package:plupool/features/store/data/models/store_order_model.dart';
import 'package:plupool/features/store/data/models/update_cart_item_request.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart({required AddToCartRequestModel request});
  Future<CartCountModel> getCartCount();
  Future<CartModel> getCart();
  Future<void> deleteCartItem({required int cartItemId});
  Future<void> updateCartItem({
    required int cartItemId,
    required UpdateCartItemRequest request,
  });
  Future<StoreOrderModel> confirmOrder({
   required ConfirmOrderRequestModel request,
  });
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImpl(this.apiService);

  @override
  Future<void> addToCart({required AddToCartRequestModel request}) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await apiService.post(
      '${Endpoints.baseUrl}/pool-owner/store/cart/items',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      data: request.toJson(),
    );
  }

  @override
  Future<CartCountModel> getCartCount() async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final data = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/store/cart/count',
      options: Options(
        headers: {
          'Authorization':
              'Bearer $token',
        },
      ),
    );

    return CartCountModel.fromJson(data.data);
  }

  @override
  Future<CartModel> getCart() async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/store/cart',
      options: Options(
        headers: {
          'Authorization':
              'Bearer $token',
        },
      ),
    );

    return CartModel.fromJson(response.data);
  }

  @override
  Future<void> deleteCartItem({required int cartItemId}) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await apiService.delete(
      '${Endpoints.baseUrl}/pool-owner/store/cart/items/$cartItemId',
      options: Options(
        headers: {
          'Authorization':
              'Bearer $token',
        },
      ),
    );
  }

  @override
  Future<void> updateCartItem({
    required int cartItemId,
    required UpdateCartItemRequest request,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await apiService.patch(
      '${Endpoints.baseUrl}/pool-owner/store/cart/items/$cartItemId',
      options: Options(
        headers: {
          'Authorization':
              'Bearer $token',
        },
      ),
      data: request.toJson(),
    );
  }

  @override
  Future<StoreOrderModel> confirmOrder({
    required ConfirmOrderRequestModel request,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await apiService.post(
      '${Endpoints.baseUrl}/pool-owner/store/orders',
       options: Options(
        headers: {
          'Authorization':
              'Bearer $token',
        },
      ),
      data: request.toJson(),
    );

    return StoreOrderModel.fromJson(response.data);
  }
}
