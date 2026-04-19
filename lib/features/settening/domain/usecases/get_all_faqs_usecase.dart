import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/domain/repos/faq_repo.dart';

class GetAllFaqsUseCase {
  final FaqRepository repository;

  GetAllFaqsUseCase(this.repository);

  Future<List<FaqEntity>> call({
    String? role,
    String? category,
    bool? isActive,
  }) {
    return repository.getFaqs(
      role: role,
      category: category,
      isActive: isActive,
    );
  }
}