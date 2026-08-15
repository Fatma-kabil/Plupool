class CreateClientResponseEntity {
  final String message;
  final int companyRepId;
  final int clientId;
  final int assignmentId;
  final bool clientCreated;
  final bool assignmentCreated;
  final ClientEntity client;

  CreateClientResponseEntity({
    required this.message,
    required this.companyRepId,
    required this.clientId,
    required this.assignmentId,
    required this.clientCreated,
    required this.assignmentCreated,
    required this.client,
  });
}

class ClientEntity {
  final int id;
  final String fullName;
  final String phone;
  final String? profileImage;
  final String? address;
  final String? poolTypeName;
  final bool isActive;

  ClientEntity({
    required this.id,
    required this.fullName,
    required this.phone,
    this.profileImage,
    this.address,
    this.poolTypeName,
    required this.isActive,
  });
}