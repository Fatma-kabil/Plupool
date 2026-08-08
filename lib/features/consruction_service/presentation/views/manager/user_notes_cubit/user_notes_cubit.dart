import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/consruction_service/data/models/user_note_model.dart';
import 'package:plupool/features/consruction_service/domain/usecases/add_user_note_usecase.dart';
import 'package:plupool/features/consruction_service/domain/usecases/get_user_notes_usecase.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/user_notes_cubit/user_notes_state.dart';

class UserNotesCubit extends Cubit<UserNotesState> {
  UserNotesCubit(this.getUserNotesUseCase, this.addUserNoteUseCase)
    : super(UserNotesInitial());

  final GetUserNotesUsecase getUserNotesUseCase;
  final AddUserNoteUseCase addUserNoteUseCase;

  Future<void> getUserNotes() async {
    print("🟡 getUserNotes START");
    emit(UserNotesLoading());
    await _refreshNotes();
    print("🟢 getUserNotes END");
  }

  Future<void> _refreshNotes() async {
    print("🟡 calling getUserNotesUseCase");
    final result = await getUserNotesUseCase();
    print("🟢 getUserNotesUseCase RETURNED");

    result.fold(
      (failure) {
        print("🔴 FAILURE: ${failure.message}");
        emit(UserNotesFailure(failure.message));
      },
      (userNotes) {
        print("🟢 SUCCESS: ${userNotes.length}");
        emit(UserNotesSuccess(userNotes));
      },
    );
  }

  Future<void> addUserNote(AddNoteModel model) async {
    emit(UserNotesAdding());

    final result = await addUserNoteUseCase(model);

    result.fold(
      (failure) async {
        emit(UserNotesOperationFailure(failure.message));

        // إعادة تحميل الملاحظات حتى بعد الفشل
        await _refreshNotes();
      },
      (_) async {
        emit(UserNotesAddedSuccessfully());

        // إعادة تحميل الملاحظات بعد النجاح
        await _refreshNotes();
      },
    );
  }
}
