import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/domain/entities/user_notes_entity.dart';
import 'package:plupool/features/consruction_service/domain/repos/user_notes_repo.dart';

class GetUserNotesUsecase {
  final UserNotesRepo repo;

  GetUserNotesUsecase(this.repo);

  Future<Either<Failure, List<UserNotesEntity>>> call() {
    return repo.getNotes();
  }
}