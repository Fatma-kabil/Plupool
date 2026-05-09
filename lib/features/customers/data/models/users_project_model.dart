class UsersProjectModel {
  final int id;
  final String nameAr;
  final String projectType;
  final String status;
  final String startDate;
  final int? progressPercentage;
  final DateTime createdAt;

  UsersProjectModel({
    required this.id,
    required this.nameAr,
    required this.projectType,
    required this.status,
    required this.startDate,
    this.progressPercentage,
    required this.createdAt,
  });

  factory UsersProjectModel.fromJson(Map<String, dynamic> json) {
    return UsersProjectModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameAr: json['name_ar'] ?? '',
      projectType: json['project_type'] ?? '',
      status: json['status'] ?? '',
      startDate: json['start_date'] ?? '',
      progressPercentage: (json['progress_percentage'] as num?)?.toInt(),
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
          DateTime.now(),
    );
  }
}