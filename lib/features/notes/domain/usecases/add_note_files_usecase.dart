import 'package:plupool/features/notes/domain/repos/notes_repo.dart';

import '../../data/models/note_model.dart';

class AddNoteFilesUseCase {
  final NotesRepository repository;

  AddNoteFilesUseCase(this.repository);

  Future<void> call({
    required int userId,
    required int noteId,
    required AddNoteFilesModel model,
  }) {
    return repository.addFilesToNote(
      userId: userId,
      noteId: noteId,
      model: model,
    );
  }
}