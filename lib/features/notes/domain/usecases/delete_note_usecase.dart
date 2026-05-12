import 'package:plupool/features/notes/domain/repos/notes_repo.dart';


class DeleteNoteUseCase {
  final NotesRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call({
    required int userId,
    required int noteId,
  }) {
    return repository.deleteNote(
      userId: userId,
      noteId: noteId,
    );
  }
}