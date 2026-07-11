import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/home/domain/params/add_support_message_params.dart';
import 'package:plupool/features/home/domain/repos/support_repo.dart';

class AddSupportMessageUseCase {
  final SupportRepository repository;

  AddSupportMessageUseCase(this.repository);

  Future<Either<Failure, void>> call(AddSupportMessageParams params) {
    return repository.addSupportMessage(params);
  }
}
