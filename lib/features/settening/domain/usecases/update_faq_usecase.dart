import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/domain/repos/faq_repo.dart';

class UpdateFaqUseCase {
  final FaqRepository repo;

  UpdateFaqUseCase(this.repo);

  Future<void> call(FaqEntity faq) {
    return repo.updateFaq(faq);
  }
}