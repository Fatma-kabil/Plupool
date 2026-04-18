
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/offers/domain/usecases/add_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/delete_offer_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/get_all_offers_usecase.dart';
import 'package:plupool/features/offers/domain/usecases/update_offer_usecase.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_state.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';

class OfferCubit extends Cubit<OfferState> {
  final GetAllOffersUsecase getAllOffers;
  final AddOfferUsecase addOfferUseCase;
  final UpdateOfferUsecase updateOfferUseCase;
  final DeleteOfferUsecase deleteOfferUseCase;

  OfferCubit(
    this.getAllOffers,
    this.addOfferUseCase,
    this.updateOfferUseCase,
    this.deleteOfferUseCase,
  ) : super(OfferInitial());

  /// ================= GET ALL =================
  Future<void> fetchOffers([ProductParams? params]) async {
    emit(OfferLoading());

    try {
      final offers = await getAllOffers(params ?? const ProductParams());

      emit(OfferLoaded(offers));
    } catch (e) {
      if (e is Failure) {
        emit(OfferError(e.message));
        print(  "ERROR FETCHING OFFERS: ${e.message}");
        
      } else {
        emit(OfferError("حدث خطأ أثناء جلب العروض"));
        print(  "ERROR FETCHING OFFERS: $e");
      }
    }
  }

  /// ================= ADD =================
  Future<void> addOffer(OfferEntity offer) async {
    emit(OfferLoading()); // 👈 مهم

    try {
      await addOfferUseCase(offer);

      emit(OfferSuccess("تم إضافة العرض بنجاح"));
      fetchOffers(ProductParams());
    } catch (e) {
      print("FULL ERROR: $e");

      if (e is DioException) {
        print("RESPONSE DATA: ${e.response?.data}");
      }

      if (e is Failure) {
        emit(AddOfferError(e.message));
         fetchOffers(ProductParams());
      } else {
        emit(AddOfferError("حدث خطأ أثناء إضافة العرض"));
         fetchOffers(ProductParams());
      }
    }
  }

  /// ================= UPDATE =================
  Future<void> updateOffer(OfferEntity offer) async {
    try {
      await updateOfferUseCase(offer);

      emit(OfferSuccess("تم تعديل العرض"));

      fetchOffers(ProductParams());
    } catch (e) {
      if (e is Failure) {
        emit(UpdateOfferError(e.message));
         fetchOffers(ProductParams());
      } else {
       //  emit(ProductError(e.toString()));
       print("FULL ERROR: $e");
        emit(UpdateOfferError("حدث خطأ أثناء تعديل العرض"));
         fetchOffers(ProductParams());
      }
    }
  }

  /// ================= DELETE =================
  Future<void> deleteOffer(int id) async {
    try {
      await deleteOfferUseCase(id);

      emit(OfferSuccess("تم حذف العرض بنجاح 🗑️"));

      fetchOffers(ProductParams());
    } catch (e) {
      if (e is Failure) {
        emit(DeleteOfferError(e.message));
         fetchOffers(ProductParams());
      } else {
        emit(DeleteOfferError("حدث خطأ أثناء حذف العرض"));
         fetchOffers(ProductParams());
      }
    }
  }
}
