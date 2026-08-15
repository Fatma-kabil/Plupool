import '../../domain/entities/create_client_response_entity.dart';

class CreateClientResponseModel extends CreateClientResponseEntity {
  CreateClientResponseModel({
    required super.message,
    required super.companyRepId,
    required super.clientId,
    required super.assignmentId,
    required super.clientCreated,
    required super.assignmentCreated,
    required super.client,
  });

  factory CreateClientResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateClientResponseModel(
      message: json['message'] ?? '',
      companyRepId: json['company_rep_id'] ?? 0,
      clientId: json['client_id'] ?? 0,
      assignmentId: json['assignment_id'] ?? 0,
      clientCreated: json['client_created'] ?? false,
      assignmentCreated: json['assignment_created'] ?? false,
      client: ClientModel.fromJson(
        json['client'] ?? {},
      ),
    );
  }
}

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

  factory ClientModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ClientModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profile_image'],
      address: json['address'],
      poolTypeName: json['pool_type_name'],
      isActive: json['is_active'] ?? false,
    );
  }
}