import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/reports/domain/entities/contact_mesage_response.dart';
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';
import 'package:plupool/features/support/domain/usecases/delete_message_usecase.dart';
import 'package:plupool/features/support/domain/usecases/get_message_details_usecase.dart';
import 'package:plupool/features/support/domain/usecases/get_messages_usecase.dart';
import 'package:plupool/features/support/domain/usecases/update_status_usecase.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final GetMessagesUseCase getUseCase;
  final GetMessageDetailsUseCase getDetailsUseCase;
  final DeleteMessageUseCase deleteUseCase;
  final UpdateStatusUseCase updateUseCase;

  ContactCubit(
    this.getUseCase, {
    required this.getDetailsUseCase,
    required this.deleteUseCase,
    required this.updateUseCase,
  }) : super(ContactInitial());

  /// cache
  ContactMessagesResponse? _cachedResponse;
  int _complaintPendingCount = 0;
  int _contactPendingCount = 0;
  String? _status;
  String? _senderRole;
  String? _search;
  String? _type;
  int? _userId;

  Future<void> loadComplaintCount() async {
    try {
      final response = await getUseCase(
        type: "complaint",
        status: "pending_review",
      );

      _complaintPendingCount = response.statistics.pendingReview;

      emit(ContactCountUpdated());
    } catch (_) {}
  }

  Future<void> loadContactCount() async {
    try {
      final response = await getUseCase(
        type: "contact",
        status: "pending_review",
      );

      _contactPendingCount = response.statistics.pendingReview;

      emit(ContactUsCountUpdated());
    } catch (_) {}
  }

  ///==============================
  /// GET ALL
  ///==============================
  Future<void> getMessages({
    int skip = 0,
    int limit = 200,
    String? status,
    String? senderRole,
    String? search,
    String? type,
    int? userId,
  }) async {
    emit(ContactLoading());

    try {
      _status = status;
      _senderRole = senderRole;
      _search = search;
      _type = type;
      _userId = userId;


      final response = await getUseCase(
        status: status,
        senderRole: senderRole,
        search: search,
        type: type,
        userId: userId
      );

      _cachedResponse = response;

      emit(ContactSuccess(response));
    } catch (e) {
      emit(
        ContactError(e is Failure ? e.message : "حدث خطأ أثناء جلب الرسائل"),
      );
    }
  }

  ///==============================
  /// DETAILS
  ///==============================
  Future<void> getMessageDetails(int id) async {
    try {
      emit(ContactDetailsLoading());

      final message = await getDetailsUseCase(id);

      emit(ContactDetailsSuccess(message));
    } catch (e) {
      emit(
        ContactDetailsError(
          e is Failure ? e.message : "حدث خطأ أثناء جلب التفاصيل",
        ),
      );

      if (_cachedResponse != null) {
        emit(ContactSuccess(_cachedResponse!));
      }
    }
  }

  ///==============================
  /// DELETE
  ///==============================
  Future<void> deleteMessage(int id) async {
    try {
      emit(ContactDeleting());

      await deleteUseCase(id);

      final response = await getUseCase(
        status: _status,
        senderRole: _senderRole,
        search: _search,
        type: _type,
        userId: _userId
      );
      _cachedResponse = response;

      await loadComplaintCount();
      await loadContactCount();

      emit(ContactDeleteSuccess());
      emit(ContactSuccess(response));
    } catch (e) {
      emit(
        ContactDeleteError(
          e is Failure ? e.message : "حدث خطأ أثناء حذف الرسالة",
        ),
      );

      if (_cachedResponse != null) {
        emit(ContactSuccess(_cachedResponse!));
      }
    }
  }

  ///==============================
  /// UPDATE STATUS
  ///==============================
  Future<void> updateMessageStatus(int id, String status) async {
    try {
      emit(ContactUpdateLoading());

      await updateUseCase(id, status);

      final response = await getUseCase(
        status: _status,
        senderRole: _senderRole,
        search: _search,
        type: _type,
        userId: _userId
      );

      _cachedResponse = response;

      await loadComplaintCount();
      await loadContactCount();
      emit(ContactUpdateSuccess());
      emit(ContactSuccess(response));
    } catch (e) {
      emit(
        ContactUpdateError(
          e is Failure ? e.message : "حدث خطأ أثناء تحديث الحالة",
        ),
      );

      if (_cachedResponse != null) {
        emit(ContactSuccess(_cachedResponse!));
      }
    }
  }

  ///==============================
  /// REFRESH
  ///==============================
  Future<void> refresh() async {
    await getMessages(
      status: _status,
      senderRole: _senderRole,
      search: _search,
      type: _type,
      userId: _userId
    );
  }

  ///==============================
  /// GETTERS
  ///==============================

  ContactMessagesResponse? get cachedResponse => _cachedResponse;

  List<ContactMessageEntity> get messages => _cachedResponse?.messages ?? [];
  int get complaintPendingCount => _complaintPendingCount;
  int get contactPendingCount => _contactPendingCount;

  int get total => _cachedResponse?.total ?? 0;

  int get pendingReview => _cachedResponse?.statistics.pendingReview ?? 0;

  int get inProgress => _cachedResponse?.statistics.inProgress ?? 0;

  int get resolved => _cachedResponse?.statistics.resolved ?? 0;

  int get company => _cachedResponse?.statistics.company ?? 0;
}
