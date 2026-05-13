import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';

import 'package:plupool/features/notes/data/models/note_model.dart';
import 'package:plupool/features/notes/domain/entities/note_entity.dart';

import 'package:plupool/features/notes/domain/usecases/add_note_files_usecase.dart';
import 'package:plupool/features/notes/domain/usecases/add_notes_usecase.dart';
import 'package:plupool/features/notes/domain/usecases/delee_note_file_usecase.dart';
import 'package:plupool/features/notes/domain/usecases/delete_note_usecase.dart';
import 'package:plupool/features/notes/domain/usecases/get_notes_usecase.dart';
import 'package:plupool/features/notes/domain/usecases/update_note_usecase.dart';

import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final GetNotesUseCase getNotesUseCase;
  final AddNoteUseCase addNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final AddNoteFilesUseCase addNoteFilesUseCase;
  final DeleteNoteFileUseCase deleteNoteFileUseCase;

  NotesCubit({
    required this.getNotesUseCase,
    required this.addNoteUseCase,
    required this.updateNoteUseCase,
    required this.deleteNoteUseCase,
    required this.addNoteFilesUseCase,
    required this.deleteNoteFileUseCase,
  }) : super(NotesInitial());

  /// ✅ خزنة الداتا الحالية
  List<NoteEntity> notes = [];

  /// ================= GET NOTES =================

  Future<void> getNotes(int userId) async {
    emit(GetNotesLoading());

    try {
      final response = await getNotesUseCase(userId);

      /// ✅ خزني الداتا
      notes = response.notes;

      emit(GetNotesSuccess(notes));
    } catch (e) {
      if (e is Failure) {
        emit(GetNotesError(e.message));
      } else {
        emit(GetNotesError('حدث خطأ أثناء جلب الملاحظات'));
        print(e);
      }
    }
  }

  /// ================= ADD NOTE =================

  Future<void> addNote({
    required int userId,
    required AddNoteModel model,
  }) async {
    emit(AddNoteLoading());

    try {
      await addNoteUseCase(userId: userId, model: model);

      emit(AddNoteSuccess());

      await getNotes(userId);
    } catch (e) {
      /// ✅ رجعي الداتا القديمة
      emit(GetNotesSuccess(notes));

      if (e is Failure) {
        emit(AddNoteError(e.message));
      } else {
        emit(AddNoteError('حدث خطأ أثناء إضافة الملاحظة'));
        print(e);
      }
    }
  }

  /// ================= UPDATE NOTE =================

  Future<void> updateNote({
    required int userId,
    required int noteId,
    required UpdateNoteModel model,
  }) async {
    emit(UpdateNoteLoading());

    try {
      await updateNoteUseCase(
        userId: userId,
        noteId: noteId,
        model: model,
      );

      emit(UpdateNoteSuccess());

      await getNotes(userId);
    } catch (e) {
      /// ✅ رجعي الداتا القديمة
      emit(GetNotesSuccess(notes));

      if (e is Failure) {
        emit(UpdateNoteError(e.message));
      } else {
        emit(UpdateNoteError('حدث خطأ أثناء تعديل الملاحظة'));
      }
    }
  }

  /// ================= ADD FILES =================

  Future<void> addFilesToNote({
    required int userId,
    required int noteId,
    required AddNoteFilesModel model,
  }) async {
    emit(AddNoteFilesLoading());

    try {
      await addNoteFilesUseCase(
        userId: userId,
        noteId: noteId,
        model: model,
      );

      emit(AddNoteFilesSuccess());

      await getNotes(userId);
    } catch (e) {
      /// ✅ رجعي الداتا القديمة
      emit(GetNotesSuccess(notes));

      if (e is Failure) {
        emit(AddNoteFilesError(e.message));
      } else {
        emit(AddNoteFilesError('حدث خطأ أثناء إضافة الملفات'));
      }
    }
  }

  /// ================= DELETE NOTE =================

  Future<void> deleteNote({
    required int userId,
    required int noteId,
  }) async {
    emit(DeleteNoteLoading());

    try {
      await deleteNoteUseCase(
        userId: userId,
        noteId: noteId,
      );

      emit(DeleteNoteSuccess());

      await getNotes(userId);
    } catch (e) {
      /// ✅ رجعي الداتا القديمة
      emit(GetNotesSuccess(notes));

      if (e is Failure) {
        emit(DeleteNoteError(e.message));
      } else {
        emit(DeleteNoteError('حدث خطأ أثناء حذف الملاحظة'));
      }
    }
  }

  /// ================= DELETE FILE =================

  Future<void> deleteNoteFile({
    required int userId,
    required int noteId,
    required int fileId,
  }) async {
    emit(DeleteNoteFileLoading());

    try {
      await deleteNoteFileUseCase(
        userId: userId,
        noteId: noteId,
        fileId: fileId,
      );

      emit(DeleteNoteFileSuccess());

      await getNotes(userId);
    } catch (e) {
      /// ✅ رجعي الداتا القديمة
      emit(GetNotesSuccess(notes));

      if (e is Failure) {
        emit(DeleteNoteFileError(e.message));
      } else {
        emit(DeleteNoteFileError('حدث خطأ أثناء حذف الملف'));
      }
    }
  }
}