class PoolDimensions {
  final double width;
  final double depth;
  final double length;

  PoolDimensions({
    required this.width,
    required this.depth,
    required this.length,
  });
}

class ServiceRequestEntity {
  final int id;
  final int userId;
  final String userName;
  final String userAvatar;
  final String userPhone;
  final String userRole;
  final String userRoleLabel;
  final String bookingType;
  final String tab;
  final String serviceTypeName;
  final String poolTypeName;
  final PoolDimensions poolDimensions;
  final String suggestedDate;
  final String suggestedDateRaw;
  final String suggestedTime;
  final String status;
  final String statusLabel;
  final String createdAt;
  final String createdAtDisplay;

  ServiceRequestEntity({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.userPhone,
    required this.userRole,
    required this.userRoleLabel,
    required this.bookingType,
    required this.tab,
    required this.serviceTypeName,
    required this.poolTypeName,
    required this.poolDimensions,
    required this.suggestedDate,
    required this.suggestedDateRaw,
    required this.suggestedTime,
    required this.status,
    required this.statusLabel,
    required this.createdAt,
    required this.createdAtDisplay,
  });
}