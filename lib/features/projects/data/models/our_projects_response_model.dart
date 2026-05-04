import 'package:plupool/features/projects/data/models/our_project_moddel.dart';

class OurProjectsResponseModel {
  final int total;
  final List<OurProjectModel> projects;

  OurProjectsResponseModel({
    required this.total,
    required this.projects,
  });

  factory OurProjectsResponseModel.fromJson(Map<String, dynamic> json) {
    return OurProjectsResponseModel(
      total: json['total'] ?? 0,
      projects: (json['projects'] as List)
          .map((e) => OurProjectModel.fromJson(e))
          .toList(),
    );
  }
}