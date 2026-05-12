import 'package:plupool/features/notes/domain/repos/notes_repo.dart';

import '../../data/models/note_model.dart';

class UpdateNoteUseCase {
  final NotesRepository repository;

  UpdateNoteUseCase(this.repository);

  Future<void> call({
    required int userId,
    required int noteId,
    required UpdateNoteModel model,
  }) {
    return repository.updateNote(
      userId: userId,
      noteId: noteId,
      model: model,
    );
  }
}