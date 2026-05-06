class UsersProjectModel {
  final int id;
  final String nameAr;
  final String projectType;
  final String status;
  final String startDate;
  final int progressPercentage;
  final DateTime createdAt;

  UsersProjectModel({
    required this.id,
    required this.nameAr,
    required this.projectType,
    required this.status,
    required this.startDate,
    required this.progressPercentage,
    required this.createdAt,
  });

  factory UsersProjectModel.fromJson(Map<String, dynamic> json) {
    return UsersProjectModel(
      id: json['id'],
      nameAr: json['name_ar'],
      projectType: json['project_type'],
      status: json['status'],
      startDate: json['start_date'],
      progressPercentage: json['progress_percentage'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}