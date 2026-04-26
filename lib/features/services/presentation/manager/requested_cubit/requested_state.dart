import 'package:plupool/features/services/domain/entities/requests_response_entity.dart';
import 'package:plupool/features/services/domain/entities/service_request_entity.dart';


abstract class RequestsState {}

/// 🚀 Initial
class RequestsInitial extends RequestsState {}

/// ⏳ Loading list
class RequestsLoading extends RequestsState {}

/// ✅ Success list
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

/// 📄 Details loading
class RequestDetailsLoading extends RequestsState {}

/// 📄 Details success
class RequestDetailsSuccess extends RequestsState {
  final ServiceRequestEntity request;

  RequestDetailsSuccess(this.request);
}

/// 📄 Details error
class RequestDetailsError extends RequestsState {
  final String message;

  RequestDetailsError(this.message);
}

/// ⚙️ Action loading (delete / update status)
class RequestsActionLoading extends RequestsState {}

/// ⚙️ Action success
class RequestActionSuccess extends RequestsState {}

/// ⚙️ Action error
class RequestActionError extends RequestsState {
  final String message;

  RequestActionError(this.message);
}

/// 🗑 Delete states (optional but consistent with your style)
class RequestsDeleting extends RequestsState {}

class RequestDeleteSuccess extends RequestsState {}

class RequestDeleteError extends RequestsState {
  final String message;

  RequestDeleteError(this.message);
}