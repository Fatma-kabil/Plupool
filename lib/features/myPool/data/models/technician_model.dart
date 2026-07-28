import '../../domain/entities/technician_entity.dart';

class TechnicianModel extends TechnicianEntity {
  const TechnicianModel({
    required super.id,
    required super.name,
    required super.phone,
    super.profileImage,
  });

  factory TechnicianModel.fromJson(Map<String, dynamic> json) {
    return TechnicianModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profile_image'],
    );
  }

  TechnicianEntity toEntity() => this;
}