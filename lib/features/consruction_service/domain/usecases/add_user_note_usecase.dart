import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/data/models/user_note_model.dart';
import 'package:plupool/features/consruction_service/domain/entities/user_notes_entity.dart';
import 'package:plupool/features/consruction_service/domain/repos/user_notes_repo.dart';

class AddUserNoteUseCase {
  final UserNotesRepo repo;

  AddUserNoteUseCase(this.repo);

  Future<Either<Failure, UserNotesEntity>> call(
    AddNoteModel model,
  ) {
    return repo.addNote(model);
  }
}