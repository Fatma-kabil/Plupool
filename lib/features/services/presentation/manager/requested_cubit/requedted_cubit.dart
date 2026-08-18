import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/services/domain/entities/requests_response_entity.dart';
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

  List<ServiceRequestEntity> _cachedRequests = [];

  String? _tab;
  String? _search;
  String? _sortBy;
  String? _status;

  int _page = 1;

  TabCounts? _tabCounts;

  TabCounts? get tabCounts => _tabCounts;

  // ============================================================
  // GET REQUESTS
  // ============================================================

  Future<void> getRequests({
    int page = 1,
    int limit = 100,
    String? tab,
    String? search,
    String? sortBy,
    String? status,
  }) async {
    if (state is! RequestsSuccess) {
      emit(RequestsLoading());
    }

    try {
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

      // حفظ الطلبات
      _cachedRequests = response.requests;

      // ========================================================
      // ⭐ أهم تعديل
      // ========================================================

      _tabCounts = response.tabCounts;

      print('========== CUBIT COUNTS ==========');
      print('maintenance = ${_tabCounts?.maintenance}');
      print('construction = ${_tabCounts?.construction}');
      print('==================================');

      emit(
        RequestsSuccess(
          requests: response.requests,
          tabCounts: _tabCounts,
        ),
      );
    } catch (e) {
      emit(
        RequestsError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء جلب الطلبات",
        ),
      );

      print(e);
    }
  }

  // ============================================================
  // DETAILS
  // ============================================================

  Future<void> getRequestDetails(int id) async {
    try {
      emit(RequestDetailsLoading());

      final request = await getDetailsUseCase(id);

      emit(RequestDetailsSuccess(request));
    } catch (e) {
      emit(
        RequestDetailsError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء جلب التفاصيل",
        ),
      );

      if (_cachedRequests.isNotEmpty) {
        emit(
          RequestsSuccess(
            requests: _cachedRequests,
            tabCounts: _tabCounts,
          ),
        );
      }
    }
  }

  // ============================================================
  // DELETE
  // ============================================================

  Future<void> deleteRequest(int id) async {
    try {
      emit(RequestsActionLoading());

      await deleteUseCase(id);

      _search = null;
      _status = "new";
      _page = 1;

      final response = await getUseCase(
        GetRequestsParams(
          tab: _tab,
          search: null,
          sortBy: _sortBy,
          status: "new",
          page: 1,
          limit: 100,
        ),
      );

      _cachedRequests = response.requests;

      // بعد الحذف نحدث الأرقام
      _tabCounts = response.tabCounts;

      emit(RequestDeleteSuccess());

      emit(
        RequestsSuccess(
          requests: _cachedRequests,
          tabCounts: _tabCounts,
        ),
      );
    } catch (e) {
      emit(
        RequestDeleteError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء حذف الطلب",
        ),
      );

      emit(
        RequestsSuccess(
          requests: _cachedRequests,
          tabCounts: _tabCounts,
        ),
      );
    }
  }

  // ============================================================
  // UPDATE STATUS
  // ============================================================

  Future<void> updateStatus(
    int id,
    String status,
  ) async {
    try {
      emit(RequestsActionLoading());

      await updateStatusUseCase(id, status);

      final response = await getUseCase(
        GetRequestsParams(
          tab: _tab,
          search: _search,
          sortBy: _sortBy,
          status: _status,
          page: _page,
          limit: 100,
        ),
      );

      _cachedRequests = response.requests;

      // ❌ لا نغير tabCounts هنا

      emit(RequestActionSuccess());

      emit(
        RequestsSuccess(
          requests: response.requests,
          tabCounts: _tabCounts,
        ),
      );
    } catch (e) {
      emit(
        RequestActionError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء تحديث الحالة",
        ),
      );

      emit(
        RequestsSuccess(
          requests: _cachedRequests,
          tabCounts: _tabCounts,
        ),
      );
    }
  }

  // ============================================================
// GET NEW REQUESTS COUNT FOR DRAWER
// ============================================================

Future<void> getNewRequestsCount() async {
  try {
    final response = await getUseCase(
      GetRequestsParams(
        page: 1,
        limit: 100,
        status: "new",
      ),
    );

    _tabCounts = response.tabCounts;

    print('========== DRAWER COUNTS ==========');
    print('maintenance = ${_tabCounts?.maintenance}');
    print('construction = ${_tabCounts?.construction}');
    print('===================================');

    emit(
      RequestsSuccess(
        requests: _cachedRequests,
        tabCounts: _tabCounts,
      ),
    );
  } catch (e) {
    print('GET DRAWER COUNT ERROR: $e');
  }
}

  // ============================================================
  // REFRESH
  // ============================================================

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