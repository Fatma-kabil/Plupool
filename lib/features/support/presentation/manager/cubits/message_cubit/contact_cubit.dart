import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/support/domain/entities/contact_entity.dart';
import 'package:plupool/features/support/domain/usecases/delete_message_usecase.dart';
import 'package:plupool/features/support/domain/usecases/get_message_details_usecase.dart';
import 'package:plupool/features/support/domain/usecases/get_messages_usecase.dart';
import 'package:plupool/features/support/domain/usecases/update_status_usecase.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';


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

  /// 🔥 cache
  List<ContactEntity> _cachedMessages = [];

  /// 🔥 filters
  
  String? _status;
  String? _senderRole;
  String? _search;

  /// 📋 GET MESSAGES
  Future<void> getMessages({
    int skip = 0,
    int limit = 50,
    String? status,
    String? senderRole,
    String? search,
  }) async {
    emit(ContactLoading());

    try {
      /// حفظ الفلاتر
      
      _status = status;
      _senderRole = senderRole;
      _search = search;

      final messages = await getUseCase(
       
        status: status,
        senderRole: senderRole,
        search: search,
      );

      _cachedMessages = messages;

      emit(ContactSuccess(messages));
    } catch (e) {
      emit(ContactError(
        e is Failure ? e.message : "حدث خطأ أثناء جلب الرسائل",
      ));
    }
  }

  /// 🗑 DELETE
  Future<void> deleteMessage(int id) async {
    try {
      emit(ContactDeleting());

      await deleteUseCase(id);

      final messages = await getUseCase(
        
        status: _status,
        senderRole: _senderRole,
        search: _search,
      );

      _cachedMessages = messages;

      emit(ContactSuccess(messages));
      emit(ContactDeleteSuccess());
      
      emit(ContactSuccess(messages));
    } catch (e) {
      emit(ContactDeleteError(
        e is Failure ? e.message : "حدث خطأ أثناء حذف الرسالة",
      ));

      /// 🔥 rollback
      emit(ContactSuccess(_cachedMessages));
    }
  }

  /// ✏️ UPDATE STATUS
  Future<void> updateMessageStatus(int id, String status) async {
    try {
      emit(ContactLoading());

      await updateUseCase(id, status);

      final messages = await getUseCase(
        
        status: _status,
        senderRole: _senderRole,
        search: _search,
      );

      _cachedMessages = messages;

      emit(ContactSuccess(messages));
      emit(ContactActionSuccess());
    } catch (e) {
      emit(ContactUpdateError(
        e is Failure ? e.message : "حدث خطأ أثناء تحديث الحالة",
      ));

      /// 🔥 rollback
      emit(ContactSuccess(_cachedMessages));
    }
  }

  /// 🔄 REFRESH MANUAL
  Future<void> refresh() async {
    await getMessages(
     
      status: _status,
      senderRole: _senderRole,
      search: _search,
    );
  }
}