import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/services/domain/repos/requested_services_repository.dart';
import 'package:plupool/features/services/domain/usecases/get_request_details.dart';
import 'package:plupool/features/services/domain/usecases/get_requests_usecase.dart';
import 'package:plupool/features/services/domain/usecases/update_request_statue.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requested_state.dart';
import '../../../domain/entities/service_request_entity.dart';
import '../../../domain/usecases/delete_request_usecase.dart';  

class RequestsCubit extends Cubit<RequestsState> {
  final GetRequestsUseCase getUseCase;
  final GetRequestDetailsUseCase getDetailsUseCase;
  final DeleteRequestUseCase deleteUseCase;
  final UpdateRequestStatusUseCase updateStatusUseCase;

  RequestsCubit(
    this.getUseCase, {
    required this.getDetailsUseCase,
    required this.deleteUseCase,
    required this.updateStatusUseCase,
  }) : super(RequestsInitial());

  /// 🔥 cache
  List<ServiceRequestEntity> _cachedRequests = [];

  /// 🔥 filters (زي RatingsCubit بالظبط)
  String? _tab;
  String? _search;
  String? _sortBy;
  String? _status;

  int _page = 1;

  /// 📋 GET REQUESTS
  Future<void> getRequests({
    int page = 1,
    int limit = 100,
    String? tab,
    String? search,
    String? sortBy,
    String? status,
  }) async {
    emit(RequestsLoading());

    try {
      /// حفظ الفلاتر
      _tab = tab;
      _search = search;
      _sortBy = sortBy;
      _status = status;
      _page = page;

      final response = await getUseCase(
        GetRequestsParams(
          tab: tab,
          page: page,
          limit: limit,
          search: search,
          sortBy: sortBy,
          status: status,
        ),
      );

      _cachedRequests = response.requests;

      emit(RequestsSuccess(
        requests: response.requests,
        tabCounts: response.tabCounts,
      ));
    } catch (e) {
      emit(
        RequestsError(
          e is Failure ? e.message : "حدث خطأ أثناء جلب الطلبات",
        ),
      );
    }
  }

  /// 📄 DETAILS
  Future<void> getRequestDetails(int id) async {
    try {
      emit(RequestDetailsLoading());

      final request = await getDetailsUseCase(id);

      emit(RequestDetailsSuccess(request));
    } catch (e) {
      emit(
        RequestDetailsError(
          e is Failure ? e.message : "حدث خطأ أثناء جلب التفاصيل",
        ),
      );

      /// fallback
      if (_cachedRequests.isNotEmpty) {
        emit(RequestsSuccess(
          requests: _cachedRequests,
          tabCounts: null,
        ));
      }
    }
  }

  /// 🗑 DELETE
  Future<void> deleteRequest(int id) async {
    try {
      emit(RequestsDeleting());

      await deleteUseCase(id);

      /// 🔄 refetch زي RatingsCubit
      final response = await getUseCase(
        GetRequestsParams(
          tab: _tab,
          search: _search,
          sortBy: _sortBy,
          status: _status,
          page: _page,
        ),
      );

      _cachedRequests = response.requests;

      emit(RequestDeleteSuccess());

      emit(RequestsSuccess(
        requests: response.requests,
        tabCounts: response.tabCounts,
      ));
    } catch (e) {
      emit(
        RequestDeleteError(
          e is Failure ? e.message : "حدث خطأ أثناء حذف الطلب",
        ),
      );

      emit(RequestsSuccess(
        requests: _cachedRequests,
        tabCounts: null,
      ));
    }
  }

  /// 🔄 UPDATE STATUS
  Future<void> updateStatus(int id, String status) async {
    try {
      emit(RequestsActionLoading());

      await updateStatusUseCase(id, status);

      /// 🔄 refetch زي ratings
      final response = await getUseCase(
        GetRequestsParams(
          tab: _tab,
          search: _search,
          sortBy: _sortBy,
          status: _status,
          page: _page,
        ),
      );

      _cachedRequests = response.requests;

      emit(RequestActionSuccess());

      emit(RequestsSuccess(
        requests: response.requests,
        tabCounts: response.tabCounts,
      ));
    } catch (e) {
      emit(
        RequestActionError(
          e is Failure ? e.message : "حدث خطأ أثناء تحديث الحالة",
        ),
      );

      emit(RequestsSuccess(
        requests: _cachedRequests,
        tabCounts: null,
      ));
    }
  }

  /// 🔄 REFRESH
  Future<void> refresh() async {
    await getRequests(
      tab: _tab,
      search: _search,
      sortBy: _sortBy,
      status: _status,
      page: _page,
    );
  }
}