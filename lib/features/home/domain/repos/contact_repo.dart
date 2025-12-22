import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/home/domain/entities/contact_request_entity.dart';

abstract class ContactRepository {
  Future<Either<Failure, String>>sendContactMessage(ContactRequestEntity request);
}
