import 'package:plupool/features/settening/data/date_sources/faq_remote_data_source.dart';
import 'package:plupool/features/settening/data/models/faq_model.dart';
import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/domain/repos/faq_repo.dart';

class FaqRepositoryImpl implements FaqRepository {
  final FaqRemoteDataSource remote;

  FaqRepositoryImpl(this.remote);

  @override
  Future<List<FaqEntity>> getFaqs({
    String? role,
    String? category,
    bool? isActive,
  }) async {
    final result = await remote.getFaqs(
      role: role,
      category: category,
      isActive: isActive,
    );

    return result.faqs
        .map(
          (e) => FaqEntity(
            id: e.id,
            question: e.questionAr,
            answer: e.answerAr,
            sortOrder: e.sortOrder,
            isActive: e.isActive,
            targetRole: e.targetRole,
          ),
        )
        .toList();
  }

  @override
  Future<void> createFaq(FaqEntity faq) async {
    await remote.createFaq(
      FaqModel(
        id: 0,
        questionAr: faq.question,
        answerAr: faq.answer,
        category: "",
        targetRole:faq.targetRole,
        sortOrder: faq.sortOrder,
        isActive: faq.isActive,
      ),
    );
  }

 @override
  Future<void> updateFaq(FaqEntity faq) async {
    await remote.updateFaq(
      FaqModel(
        id: faq.id,
        questionAr: faq.question,
        answerAr: faq.answer,
        category: "",
        targetRole:faq.targetRole,
        sortOrder: faq.sortOrder,
        isActive: faq.isActive,
      ),
    );
  }

  @override
  Future<FaqEntity> getFaq(int id) async {
    final e = await remote.getFaq(id);

    return FaqEntity(
      id: e.id,
      question: e.questionAr,
      answer: e.answerAr,
      sortOrder: e.sortOrder,
      isActive: e.isActive,
      targetRole: e.targetRole,
    );
  }

  @override
  Future<void> deleteFaq(int id) {
    return remote.deleteFaq(id);
  }

  @override
  Future<FaqEntity> toggleFaq(int id, bool isActive) async {
    final e = await remote.toggleFaq(id, isActive);

    return FaqEntity(
      id: e.id,
      question: e.questionAr,
      answer: e.answerAr,
      sortOrder: e.sortOrder,
      isActive: e.isActive,
      targetRole: e.targetRole,
    );
  }
}