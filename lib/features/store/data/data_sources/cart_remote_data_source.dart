import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/data/models/cart_count_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart({required AddToCartRequestModel request});
  Future<CartCountModel> getCartCount();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImpl(this.apiService);

  @override
  Future<void> addToCart({required AddToCartRequestModel request}) async {
    await apiService.post(
      '${Endpoints.baseUrl}/pool-owner/store/cart/items',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
      data: request.toJson(),
    );
  }

  @override
  Future<CartCountModel> getCartCount() async {
    final data = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/store/cart/count',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
    );

    return CartCountModel.fromJson(data.data);
  }
}
