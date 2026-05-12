import 'package:plupool/features/notes/domain/repos/notes_repo.dart';



class DeleteNoteFileUseCase {
  final NotesRepository repository;

  DeleteNoteFileUseCase(this.repository);

  Future<void> call({
    required int userId,
    required int noteId,
    required int fileId,
  }) {
    return repository.deleteNoteFile(
      userId: userId,
      noteId: noteId,
      fileId: fileId,
    );
  }
}