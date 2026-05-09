class UserProjectEntity {
  final int id;
  final String nameAr;
  final String projectType;
  final String status;
  final String startDate;
  final int? progressPercentage;
  final DateTime createdAt;

  const UserProjectEntity({
    required this.id,
    required this.nameAr,
    required this.projectType,
    required this.status,
    required this.startDate,
     this.progressPercentage,
    required this.createdAt,
  });
}