

import 'package:plupool/features/products/domain/entities/product_entity.dart';

abstract class ProductState {}

/// الحالة الابتدائية
class ProductInitial extends ProductState {}

/// تحميل (لما نجيب المنتجات)
class ProductLoading extends ProductState {}

/// تحميل خاص بالـ actions (add / update / delete)
class ProductActionLoading extends ProductState {}

/// تم تحميل المنتجات
class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);
}

/// نجاح عملية (إضافة / تعديل / حذف)
class ProductSuccess extends ProductState {
  final String message;

  ProductSuccess(this.message);
}

/// خطأ
class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}