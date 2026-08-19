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

  // ============================================================
  // CACHE
  // ============================================================

  List<ServiceRequestEntity> _cachedRequests = [];

  // ============================================================
  // CURRENT FILTER DATA
  // ============================================================

  String? _tab;
  String? _search;
  String? _sortBy;
  String? _status;

  int _page = 1;

  // ============================================================
  // TAB COUNTS
  // ============================================================

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
      // حفظ حالة الفلتر الحالية
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

      // حفظ الداتا الحالية
      _cachedRequests = response.requests;

      // ========================================================
      // مهم جدًا
      //
      // ❌ ممنوع نعمل:
      //
      // _tabCounts = response.tabCounts;
      //
      // لأن response هنا ممكن يكون نتيجة:
      // search / filter / status
      //
      // والـ tabs لازم تعرض NEW فقط.
      // ========================================================

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

      print('GET REQUESTS ERROR: $e');
    }
  }

  // ============================================================
  // GET NEW REQUESTS COUNTS
  //
  // دي الوحيدة المسؤولة عن أرقام الـ Tabs
  // والأرقام دائمًا خاصة بـ status = new
  // ============================================================

  Future<void> getNewRequestsCount({
    bool emitState = true,
  }) async {
    try {
      final response = await getUseCase(
        GetRequestsParams(
          page: 1,
          limit: 100,
          status: "new",
        ),
      );

      _tabCounts = response.tabCounts;

      print('========== NEW REQUEST COUNTS ==========');
      print(
        'maintenance = ${_tabCounts?.maintenance}',
      );
      print(
        'construction = ${_tabCounts?.construction}',
      );
      print('=========================================');

      if (emitState) {
        emit(
          RequestsSuccess(
            requests: _cachedRequests,
            tabCounts: _tabCounts,
          ),
        );
      }
    } catch (e) {
      print(
        'GET NEW REQUESTS COUNT ERROR: $e',
      );
    }
  }

  // ============================================================
  // DETAILS
  // ============================================================

  Future<void> getRequestDetails(int id) async {
    try {
      emit(RequestDetailsLoading());

      final request = await getDetailsUseCase(id);

      emit(
        RequestDetailsSuccess(request),
      );
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
// ============================================================
// DELETE
// ============================================================

Future<void> deleteRequest(int id) async {
  try {
    emit(RequestsActionLoading());

    // ========================================================
    // 1. DELETE REQUEST
    // ========================================================

    await deleteUseCase(id);

    // ========================================================
    // 2. GET CURRENT LIST
    //
    // القائمة تظل حسب:
    // tab + search + sortBy + status
    // ========================================================

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

    // ========================================================
    // 3. GET NEW COUNTS ONLY
    //
    // الأرقام فوق الـ Tabs دائمًا خاصة بـ NEW
    // بغض النظر عن الفلتر أو الـ search الحالي
    // ========================================================

    await getNewRequestsCount(
      emitState: false,
    );

    // ========================================================
    // 4. DELETE SUCCESS
    // ========================================================

    emit(
      RequestDeleteSuccess(),
    );

    // ========================================================
    // 5. RETURN UPDATED DATA + NEW COUNTS
    // ========================================================

    emit(
      RequestsSuccess(
        requests: _cachedRequests,
        tabCounts: _tabCounts,
      ),
    );
  } catch (e) {
    // ========================================================
    // DELETE FAILED
    // ========================================================

    emit(
      RequestDeleteError(
        e is Failure
            ? e.message
            : "حدث خطأ أثناء حذف الطلب",
      ),
    );

    // ========================================================
    // IMPORTANT:
    // لا نغير الـ counts
    // ونرجع الداتا الموجودة كما هي
    // ========================================================

    emit(
      RequestsSuccess(
        requests: _cachedRequests,
        tabCounts: _tabCounts,
      ),
    );

    print('DELETE REQUEST ERROR: $e');
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

      // ========================================================
      // 1. UPDATE STATUS
      // ========================================================

      await updateStatusUseCase(
        id,
        status,
      );

      // ========================================================
      // 2. GET CURRENT LIST
      //
      // القائمة تظل حسب:
      // search + filter + tab
      // ========================================================

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

      // ========================================================
      // 3. GET NEW COUNTS ONLY
      //
      // مهما كان الـ filter أو search الحالي
      // الأرقام فوق تعتمد على NEW فقط.
      // ========================================================

      await getNewRequestsCount(
        emitState: false,
      );

      // ========================================================
      // 4. UPDATE SUCCESS
      // ========================================================

      emit(
        RequestActionSuccess(),
      );

      // ========================================================
      // 5. RETURN UPDATED DATA + NEW COUNTS
      // ========================================================

      emit(
        RequestsSuccess(
          requests: _cachedRequests,
          tabCounts: _tabCounts,
        ),
      );
    } catch (e) {
      // ========================================================
      // UPDATE FAILED
      // ========================================================

      emit(
        RequestActionError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء تحديث الحالة",
        ),
      );

      // ========================================================
      // IMPORTANT:
      // لو الـ update فشل، لا نغير الـ counts.
      // ونرجع الداتا الموجودة كما هي.
      // ========================================================

      emit(
        RequestsSuccess(
          requests: _cachedRequests,
          tabCounts: _tabCounts,
        ),
      );
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