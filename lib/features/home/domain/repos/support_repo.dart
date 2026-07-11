import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/home/domain/params/add_support_message_params.dart';

abstract class SupportRepository {
  Future<Either<Failure, void>> addSupportMessage(
    AddSupportMessageParams params,
  );
}