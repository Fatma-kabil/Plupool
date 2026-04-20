import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';
import 'package:plupool/features/offers/domain/usecases/add_product_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/delete_product_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/get_products_offers.dart';
import 'package:plupool/features/offers/domain/usecases/update_product_offer_usecase.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';

part 'product_offer_state.dart';

class ProductOfferCubit extends Cubit<ProductOfferState> {
  final AddProductOfferUsecase addUseCase;
  final UpdateProductOfferUsecase updateUseCase;
  final DeleteProductOfferUsecase deleteUseCase;
  final GetActiveOffersUseCase useCase;

  ProductOfferCubit(
    this.useCase, {
    required this.addUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
  }) : super(ProductOfferInitial());

  /// 🔥 cache
  List<Product> _cachedOffers = [];

  /// 🔥 filters
  int _skip = 0;
  int _limit = 100;
  List<int>? _categoryIds;
  String? _sortBy;
  String? _search;

  /// 📋 GET OFFERS
  Future<void> getOffers({
    int skip = 0,
    int limit = 100,
    List<int>? categoryIds,
    String? sortBy,
    String? search,
  }) async {
    emit(ProductOfferLoading());

    try {
      /// حفظ الفلاتر
      _skip = skip;
      _limit = limit;
      _categoryIds = categoryIds;
      _sortBy = sortBy;
      _search = search;

      final offers = await useCase(
        skip: skip,
        limit: limit,
        categoryIds: categoryIds,
        sortBy: sortBy,
        search: search,
      );

      _cachedOffers = offers;

      emit(GetProductOfferSuccess(offers));
    } catch (e) {
      emit(ProductOfferError(
        e is Failure ? e.message : "حدث خطأ أثناء جلب العروض",
      ));
    }
  }

  /// ➕ ADD
  Future<void> addOffer(ProductOfferEntity offer) async {
    try {
      emit(ProductOfferLoading());
      await addUseCase(offer);

      final offers = await useCase(
        skip: _skip,
        limit: _limit,
        categoryIds: _categoryIds,
        sortBy: _sortBy,
        search: _search,
      );

      _cachedOffers = offers;

      emit(GetProductOfferSuccess(offers));
      emit(ProductOfferSuccess());
    } catch (e) {
      emit(AddProductOfferError(
        e is Failure ? e.message : "حدث خطأ أثناء إضافة العرض",
      ));

      /// 🔥 رجع الداتا القديمة
      emit(GetProductOfferSuccess(_cachedOffers));
    }
  }

  /// ✏️ UPDATE
  Future<void> updateOffer(ProductOfferEntity offer) async {
    try {
      emit(ProductOfferLoading());
      await updateUseCase(offer);

      final offers = await useCase(
        skip: _skip,
        limit: _limit,
        categoryIds: _categoryIds,
        sortBy: _sortBy,
        search: _search,
      );

      _cachedOffers = offers;

      emit(GetProductOfferSuccess(offers));
      emit(ProductOfferSuccess());
    } catch (e) {
      emit(EditProductOfferError(
        e is Failure ? e.message : "حدث خطأ أثناء تحديث العرض",
      ));

      emit(GetProductOfferSuccess(_cachedOffers));
    }
  }

  /// 🗑 DELETE
  Future<void> deleteOffer(int id) async {
    try {
      emit(ProductOfferLoading());
      await deleteUseCase(id);

      final offers = await useCase(
        skip: _skip,
        limit: _limit,
        categoryIds: _categoryIds,
        sortBy: _sortBy,
        search: _search,
      );

      _cachedOffers = offers;

      emit(GetProductOfferSuccess(offers));
      emit(ProductOfferSuccess());
    } catch (e) {
      emit(DeleteProductOfferError(
        e is Failure ? e.message : "حدث خطأ أثناء حذف العرض",
      ));

      emit(GetProductOfferSuccess(_cachedOffers));
    }
  }
}