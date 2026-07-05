import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/domain/entities/user_notes_entity.dart';

abstract   class UserNotesRepo {
   Future<Either<Failure, List<UserNotesEntity>>> getNotes();


}