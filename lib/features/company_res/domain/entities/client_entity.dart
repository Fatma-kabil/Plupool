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