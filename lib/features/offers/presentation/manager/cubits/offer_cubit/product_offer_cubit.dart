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

  Future<void> getOffers({
    int skip = 0,
    int limit = 100,
    int? categoryId,
    String? sortBy,
  }) async {
    emit(ProductOfferLoading());

    try {
      final offers = await useCase(
        skip: skip,
        limit: limit,
        categoryId: categoryId,
        sortBy: sortBy,
      );

      emit(GetProductOfferSuccess(offers));
    } catch (e) {
       if (e is Failure) {
        emit(ProductOfferError(e.message));
      } else {
        emit(ProductOfferError("حدث خطأ أثناء جلب العروض"));
      }
     
    }
  }

  Future<void> addOffer(ProductOfferEntity offer) async {
    emit(ProductOfferLoading());
    try {
      await addUseCase(offer);
      emit(ProductOfferSuccess());
    
    } catch (e) {
      if (e is Failure) {
        emit(AddProductOfferError(e.message));
      } else {
        emit(AddProductOfferError("حدث خطأ أثناء إضافة العرض"));
      }
    }
  }

  Future<void> updateOffer(ProductOfferEntity offer) async {
    emit(ProductOfferLoading());
    try {
      await updateUseCase(offer);
      emit(ProductOfferSuccess());

    } catch (e) {
      if (e is Failure) {
        emit(EditProductOfferError(e.message));
      } else {
        emit(EditProductOfferError("حدث خطأ أثناء تحديث العرض"));
      }
    }
  }

  Future<void> deleteOffer(int id) async {
    emit(ProductOfferLoading());
    try {
      await deleteUseCase(id);
      emit(ProductOfferSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(DeleteProductOfferError(e.message));
      } else {
        emit(DeleteProductOfferError("حدث خطأ أثناء حذف العرض"));
      }
    }
  }
}
