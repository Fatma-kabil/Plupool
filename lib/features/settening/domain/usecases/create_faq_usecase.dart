import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/domain/repos/faq_repo.dart';

class CreateFaqUseCase {
  final FaqRepository repository;

  CreateFaqUseCase(this.repository);

  Future<void> call(FaqEntity faq) {
    return repository.createFaq(faq);
  }
}