import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/rating/domain/entities/rating_entities.dart';
import 'package:plupool/features/rating/domain/usecases/approve_rating.dart';
import 'package:plupool/features/rating/domain/usecases/delete_rating_usecase.dart';
import 'package:plupool/features/rating/domain/usecases/get_rating_by_id_usecase.dart';
import 'package:plupool/features/rating/domain/usecases/get_ratings_usecase.dart';
import 'package:plupool/features/rating/domain/usecases/reject_rating.dart';

import 'ratings_state.dart';

class RatingsCubit extends Cubit<RatingsState> {
  final GetRatingsUseCase getUseCase;
  final GetRatingByIdUseCase getRatingByIdUseCase;
  final ApproveRatingUseCase approveUseCase;
  final RejectRatingUseCase rejectUseCase;
  final DeleteRatingUseCase deleteUseCase;

  RatingsCubit(
    this.getUseCase, {
    required this.getRatingByIdUseCase,
    required this.approveUseCase,
    required this.rejectUseCase,
    required this.deleteUseCase,
  }) : super(RatingsInitial());

  /// 🔥 cache (FULL RESPONSE)
  RatingsEntity? _cachedResponse;

  /// 🔥 filters
  String? _status;
  String? _search;
  String? _sortBy;
  int? _rating;
  int? _serviceId;

  /// 📋 GET RATINGS
  Future<void> getRatings({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
    String? sortBy,
    int? rating,
    int? serviceId,
  }) async {
    emit(RatingsLoading());

    try {
      _status = status;
      _search = search;
      _sortBy = sortBy;
      _rating = rating;
      _serviceId = serviceId;

      final response = await getUseCase(
        page: page,
        limit: limit,
        status: status,
        search: search,
        sortBy: sortBy,
        rating: rating,
        serviceId: serviceId,
      );

      _cachedResponse = response;

      emit(RatingsSuccess(response));
    } catch (e) {
      emit(
        RatingsError(
          e is Failure ? e.message : "حدث خطأ أثناء جلب التقييمات",
        ),
      );
    }
  }

  /// 🔍 DETAILS
  Future<void> getRatingDetails(int id) async {
    try {
      emit(RatingDetailsLoading());

      final rating = await getRatingByIdUseCase(id);

      emit(RatingDetailsSuccess(rating));
    } catch (e) {
      emit(
        RatingDetailsError(
          e is Failure ? e.message : "حدث خطأ أثناء جلب تفاصيل التقييم",
        ),
      );

      if (_cachedResponse != null) {
        emit(RatingsSuccess(_cachedResponse!));
      }
    }
  }

  /// 🗑 DELETE
  Future<void> deleteRating(int id) async {
    try {
      emit(RatingsDeleting());

      await deleteUseCase(id);

      final response = await getUseCase(
        status: _status,
        search: _search,
        sortBy: _sortBy,
        rating: _rating,
        serviceId: _serviceId,
      );

      _cachedResponse = response;

      emit(RatingsDeleteSuccess());
      emit(RatingsSuccess(response));
    } catch (e) {
      emit(
        RatingsDeleteError(
          e is Failure ? e.message : "حدث خطأ أثناء حذف التقييم",
        ),
      );

      if (_cachedResponse != null) {
        emit(RatingsSuccess(_cachedResponse!));
      }
    }
  }

  /// ✅ APPROVE
  Future<void> approveRating(int id) async {
    try {
      emit(RatingsActionLoading());

      await approveUseCase(id);

      final response = await getUseCase(
        status: _status,
        search: _search,
        sortBy: _sortBy,
        rating: _rating,
        serviceId: _serviceId,
      );

      _cachedResponse = response;

      emit(RatingsActionSuccess());
      emit(RatingsSuccess(response));
    } catch (e) {
      emit(
        RatingsActionError(
          e is Failure ? e.message : "حدث خطأ أثناء الموافقة على التقييم",
        ),
      );

      if (_cachedResponse != null) {
        emit(RatingsSuccess(_cachedResponse!));
      }
    }
  }

  /// ❌ REJECT
  Future<void> rejectRating(int id) async {
    try {
      emit(RatingsLoading());

      await rejectUseCase(id);

      final response = await getUseCase(
        status: _status,
        search: _search,
        sortBy: _sortBy,
        rating: _rating,
        serviceId: _serviceId,
      );

      _cachedResponse = response;

      emit(RatingsActionSuccess());
      emit(RatingsSuccess(response));
    } catch (e) {
      emit(
        RatingsActionError(
          e is Failure ? e.message : "حدث خطأ أثناء رفض التقييم",
        ),
      );

      if (_cachedResponse != null) {
        emit(RatingsSuccess(_cachedResponse!));
      }
    }
  }

  /// 🔄 REFRESH
  Future<void> refresh() async {
    await getRatings(
      status: _status,
      search: _search,
      sortBy: _sortBy,
      rating: _rating,
      serviceId: _serviceId,
    );
  }
}