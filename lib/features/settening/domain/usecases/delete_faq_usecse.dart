import 'package:plupool/features/settening/domain/repos/faq_repo.dart';

class DeleteFaqUseCase {
  final FaqRepository repository;

  DeleteFaqUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deleteFaq(id);
  }
}