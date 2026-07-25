import '../../domain/entities/client_entity.dart';

class ClientModel extends ClientEntity {
  ClientModel({
    required super.id,
    required super.fullName,
    required super.phone,
    required super.profileImage,
    required super.address,
    required super.poolTypeName,
    required super.isActive,
    required super.bookingsCount,
    required super.latestBookingDate,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json["id"],
      fullName: json["full_name"] ?? "",
      phone: json["phone"] ?? "",
      profileImage: json["profile_image"],
      address: json["address"] ?? "",
      poolTypeName: json["pool_type_name"] ?? "",
      isActive: json["is_active"] ?? false,
      bookingsCount: json["bookings_count"] ?? 0,
      latestBookingDate: json["latest_booking_date"],
    );
  }
}