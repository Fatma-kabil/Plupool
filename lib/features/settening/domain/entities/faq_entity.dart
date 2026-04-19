class FaqEntity {
  final int? id;
  final String question;
  final String answer;
  final int sortOrder;
  final bool isActive;
  final String targetRole;

  FaqEntity({
     this.id,
     required this.targetRole,
    required this.question,
    required this.answer,
    required this.sortOrder,
    required this.isActive,
  });
}