import '../../domain/entities/service_request_entity.dart';

class PoolDimensionsModel extends PoolDimensions {
  PoolDimensionsModel({
    required super.width,
    required super.depth,
    required super.length,
  });

  factory PoolDimensionsModel.fromJson(Map<String, dynamic> json) {
    return PoolDimensionsModel(
      width: (json['width'] ?? 0).toDouble(),
      depth: (json['depth'] ?? 0).toDouble(),
      length: (json['length'] ?? 0).toDouble(),
    );
  }
}

class ServiceRequestModel extends ServiceRequestEntity {
  ServiceRequestModel({
    required super.id,
    required super.userId,
    required super.userName,
    required super.userAvatar,
    required super.userPhone,
    required super.userRole,
    required super.userRoleLabel,
    required super.bookingType,
    required super.tab,
    required super.serviceTypeName,
    required super.poolTypeName,
    required super.poolDimensions,
    required super.suggestedDate,
    required super.suggestedDateRaw,
    required super.suggestedTime,
    required super.status,
    required super.statusLabel,
    required super.createdAt,
    required super.createdAtDisplay,
  });

  factory ServiceRequestModel.fromJson(Map<String, dynamic> json) {
    return ServiceRequestModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      userName: json['user_name'] ?? '',
      userAvatar: json['user_avatar'] ?? '',
      userPhone: json['user_phone'] ?? '',
      userRole: json['user_role'] ?? '',
      userRoleLabel: json['user_role_label'] ?? '',
      bookingType: json['booking_type'] ?? '',
      tab: json['tab'] ?? '',
      serviceTypeName: json['service_type_name'] ?? '',
      poolTypeName: json['pool_type_name'] ?? '',
      poolDimensions:
          PoolDimensionsModel.fromJson(json['pool_dimensions'] ?? {}),
      suggestedDate: json['suggested_date'] ?? '',
      suggestedDateRaw: json['suggested_date_raw'] ?? '',
      suggestedTime: json['suggested_time'] ?? '',
      status: json['status'] ?? '',
      statusLabel: json['status_label'] ?? '',
      createdAt: json['created_at'] ?? '',
      createdAtDisplay: json['created_at_display'] ?? '',
    );
  }
}