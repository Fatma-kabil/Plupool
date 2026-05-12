import 'package:plupool/features/notes/domain/repos/notes_repo.dart';

import '../../data/models/note_model.dart';

class AddNoteUseCase {
  final NotesRepository repository;

  AddNoteUseCase(this.repository);

  Future<void> call({
    required int userId,
    required AddNoteModel model,
  }) {
    return repository.addNote(
      userId: userId,
      model: model,
    );
  }
}