import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/domain/repos/faq_repo.dart';

class GetFaqUseCase {
  final FaqRepository repository;

  GetFaqUseCase(this.repository);

  Future<FaqEntity> call(int id) {
    return repository.getFaq(id);
  }
}