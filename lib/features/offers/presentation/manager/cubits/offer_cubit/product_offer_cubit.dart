import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';
import 'package:plupool/features/offers/domain/usecases/add_product_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/delete_product_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/update_product_offer_usecase.dart';

part 'product_offer_state.dart';

class ProductOfferCubit extends Cubit<ProductOfferState> {
  final AddProductOfferUsecase addUseCase;
  final UpdateProductOfferUsecase updateUseCase;
  final DeleteProductOfferUsecase deleteUseCase;

  ProductOfferCubit({
    required this.addUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
  }) : super(ProductOfferInitial());

  Future<void> addOffer(ProductOfferEntity offer) async {
    emit(ProductOfferLoading());
    try {
      await addUseCase(offer);
      emit(ProductOfferSuccess());
    } catch (e) {
      emit(ProductOfferError(e.toString()));
    }
  }

  Future<void> updateOffer(ProductOfferEntity offer) async {
    emit(ProductOfferLoading());
    try {
      await updateUseCase(offer);
      emit(ProductOfferSuccess());
    } catch (e) {
      emit(ProductOfferError(e.toString()));
    }
  }

  Future<void> deleteOffer(int id) async {
    emit(ProductOfferLoading());
    try {
      await deleteUseCase(id);
      emit(ProductOfferSuccess());
    } catch (e) {
      emit(ProductOfferError(e.toString()));
    }
  }
}