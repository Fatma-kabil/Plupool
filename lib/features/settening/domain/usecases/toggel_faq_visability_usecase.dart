import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/domain/repos/faq_repo.dart';

class ToggleFaqVisibilityUseCase {
  final FaqRepository repository;

  ToggleFaqVisibilityUseCase(this.repository);

  Future<FaqEntity> call({
    required int id,
    required bool isActive,
  }) {
    return repository.toggleFaq(id, isActive);
  }
}