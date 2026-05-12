import 'package:plupool/features/notes/domain/repos/notes_repo.dart';

import '../entities/notes_response_entity.dart';

class GetNotesUseCase {
  final NotesRepository repository;

  GetNotesUseCase(this.repository);

  Future<NotesResponseEntity> call(
    int userId,
  ) {
    return repository.getNotes(userId);
  }
}