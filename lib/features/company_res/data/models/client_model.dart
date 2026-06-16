import 'package:plupool/features/company_res/domain/entities/client_entity.dart';

class ClientModel extends ClientEntity {
  ClientModel({
    required super.id,
    required super.fullName,
    required super.phone,
    super.profileImage,
    super.address,
    super.poolTypeName,
    required super.isActive,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      profileImage: json['profile_image'],
      address: json['address'],
      poolTypeName: json['pool_type_name'],
      isActive: json['is_active'],
    );
  }
}