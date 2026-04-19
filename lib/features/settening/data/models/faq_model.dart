class FaqModel {
  final int? id;
  final String questionAr;
  final String answerAr;
  final String category;
  final String targetRole;
  final int sortOrder;
  final bool isActive;

  FaqModel({
     this.id,
    required this.questionAr,
    required this.answerAr,
    required this.category,
    required this.targetRole,
    required this.sortOrder,
    required this.isActive,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      questionAr: json['question_ar'],
      answerAr: json['answer_ar'],
      category: json['category'],
      targetRole: json['target_role'],
      sortOrder: json['sort_order'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "question_ar": questionAr,
      "answer_ar": answerAr,
      "category": category,
      "target_role": targetRole,
      "sort_order": sortOrder,
      "is_active": isActive,
    };
  }
}