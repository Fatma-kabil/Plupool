import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/data/remote_data_source/user_notes_remote_data_source.dart';
import 'package:plupool/features/consruction_service/domain/entities/user_notes_entity.dart';
import 'package:plupool/features/consruction_service/domain/repos/user_notes_repo.dart';

class UserNoteRepoImpl implements UserNotesRepo {
  final UserNotesRemoteDataSource remoteDataSource;
  UserNoteRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<UserNotesEntity>>> getNotes() async {
    try {
      final result = await remoteDataSource.getNotes();
      return right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
