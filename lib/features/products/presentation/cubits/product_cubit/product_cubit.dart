import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/products/domain/usecases/add_product_usecase.dart';
import 'package:plupool/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:plupool/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:plupool/features/products/domain/usecases/update_product_usecase.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProductsUsecase getAllProducts;
  final AddProductUsecase addProductUseCase;
  final UpdateProductUsecase updateProductUseCase;
  final DeleteProductUsecase deleteProductUseCase;

  ProductCubit(
    this.getAllProducts,
    this.addProductUseCase,
    this.updateProductUseCase,
    this.deleteProductUseCase,
  ) : super(ProductInitial());

  /// ================= GET ALL =================
  Future<void> fetchProducts([ProductParams? params]) async {
    emit(ProductLoading());

    try {
      final products = await getAllProducts(params ?? const ProductParams());

      emit(ProductLoaded(products));
    } catch (e) {
      if (e is Failure) {
        emit(ProductError(e.message));
      } else {
        emit(ProductError("حصل خطأ"));
      }
    }
  }

  /// ================= ADD =================
  Future<void> addProduct(Product product) async {
    emit(ProductLoading()); // 👈 مهم

    try {
      await addProductUseCase(product);

      emit(ProductSuccess("تم إضافة المنتج بنجاح"));
      fetchProducts(ProductParams());
    } catch (e) {
      print("FULL ERROR: $e");

      if (e is DioException) {
        print("RESPONSE DATA: ${e.response?.data}");
      }

      if (e is Failure) {
        emit(ProductError(e.message));
      } else {
        emit(ProductError(e.toString()));
      }
    }
  }

  /// ================= UPDATE =================
  Future<void> updateProduct(Product product) async {
    try {
      await updateProductUseCase(product);

      emit(ProductSuccess("تم تعديل المنتج"));

      fetchProducts(ProductParams());
    } catch (e) {
      if (e is Failure) {
        emit(ProductError(e.message));
      } else {
        emit(ProductError("حصل خطأ"));
      }
    }
  }

  /// ================= DELETE =================
  Future<void> deleteProduct(int id) async {
    try {
      await deleteProductUseCase(id);

      emit(ProductSuccess("تم حذف المنتج"));

      fetchProducts(ProductParams());
    } catch (e) {
      if (e is Failure) {
        emit(ProductError(e.message));
      } else {
        emit(ProductError("حصل خطأ"));
      }
    }
  }
}
