class TechnicianEntity {
  final int id;

  final String name;

  final String phone;

  final String? profileImage;

  const TechnicianEntity({
    required this.id,
    required this.name,
    required this.phone,
    this.profileImage,
  });
}