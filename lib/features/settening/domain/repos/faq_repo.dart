import 'package:plupool/features/settening/domain/entities/faq_entity.dart';

abstract class FaqRepository {
  Future<List<FaqEntity>> getFaqs({
    String? role,
    String? category,
    bool? isActive,
  });

  Future<void> createFaq(FaqEntity faq);

  Future<FaqEntity> getFaq(int id);
  Future<void> updateFaq(FaqEntity faq);

  Future<void> deleteFaq(int id);

  Future<FaqEntity> toggleFaq(int id, bool isActive);
}