
import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';

class UserServiceModel extends UserServiceEntity {
  UserServiceModel({
    required super.bookingType,
    required super.tab,
    required super.title,
    required super.subtitle,
    required super.status,
    required super.statusLabel,
    required super.scheduledDate,
    required super.scheduledTime,
    required super.technicians,
    required super.canEdit,
    required super.canDelete,
  });

  factory UserServiceModel.fromJson(Map<String, dynamic> json) {
    return UserServiceModel(
      bookingType: json['booking_type'],
      tab: json['tab'],
      title: json['title'],
      subtitle: json['subtitle'],
      status: json['status'],
      statusLabel: json['status_label'],
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
      technicians: (json['technicians'] as List)
          .map((e) => TechnicianModel.fromJson(e))
          .toList(),
      canEdit: json['can_edit'],
      canDelete: json['can_delete'],
    );
  }
}

class TechnicianModel extends TechnicianEntity {
  TechnicianModel({
    required super.name,
    required super.phone,
    super.profileImage,
  });

  factory TechnicianModel.fromJson(Map<String, dynamic> json) {
    return TechnicianModel(
      name: json['name'],
      phone: json['phone'],
      profileImage: json['profile_image'],
    );
  }
}