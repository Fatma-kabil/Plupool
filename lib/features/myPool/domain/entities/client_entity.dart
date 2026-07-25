class ClientEntity {
  final int id;
  final String fullName;
  final String phone;
  final String? profileImage;
  final String address;
  final String poolTypeName;
  final bool isActive;
  final int bookingsCount;
  final String? latestBookingDate;

  ClientEntity({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.profileImage,
    required this.address,
    required this.poolTypeName,
    required this.isActive,
    required this.bookingsCount,
    required this.latestBookingDate,
  });
}