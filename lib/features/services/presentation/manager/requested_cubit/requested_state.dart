import 'package:plupool/features/services/domain/entities/requests_response_entity.dart';
import 'package:plupool/features/services/domain/entities/service_request_entity.dart';

abstract class RequestsState {}

/// 🚀 Initial
class RequestsInitial extends RequestsState {}

/// ⏳ Loading list
class RequestsLoading extends RequestsState {}

/// ✅ Success list (MAIN STATE)
class RequestsSuccess extends RequestsState {
  final List<ServiceRequestEntity> requests;
  final TabCounts? tabCounts;

  RequestsSuccess({
    required this.requests,
    this.tabCounts,
  });
}

/// ❌ Error list
class RequestsError extends RequestsState {
  final String message;

  RequestsError(this.message);
}

/// ============================
/// 📄 DETAILS STATES
/// ============================

class RequestDetailsLoading extends RequestsState {}

class RequestDetailsSuccess extends RequestsState {
  final ServiceRequestEntity request;

  RequestDetailsSuccess(this.request);
}

class RequestDetailsError extends RequestsState {
  final String message;

  RequestDetailsError(this.message);
}

/// ============================
/// ⚙️ ACTION STATES (update/delete)
/// ============================

class RequestsActionLoading extends RequestsState {}

class RequestActionSuccess extends RequestsState {}

class RequestActionError extends RequestsState {
  final String message;

  RequestActionError(this.message);
}

/// 🗑 Delete specific (اختياري بس منظم)
class RequestsDeleting extends RequestsState {}

class RequestDeleteSuccess extends RequestsState {}

class RequestDeleteError extends RequestsState {
  final String message;

  RequestDeleteError(this.message);
}
class TabCountsLoaded extends RequestsState {
  final TabCounts tabCounts;

  TabCountsLoaded(this.tabCounts);
}

