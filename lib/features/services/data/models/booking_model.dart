class BookingModel {
  final String bookingType;
  final String bookingDate;
  final String bookingTime;
  final String? notes;

  final int id;
  final int userId;
  final int? serviceId;
  final int poolTypeId;
  final int? packageId;

  final double? customLength;
  final double? customWidth;
  final double? customDepth;

  final String status;
  final String? adminNotes;
  final String? nextMaintenanceDate;
  final bool reminderSent;

  final String createdAt;
  final String? updatedAt;

  final String? serviceName;
  final String poolTypeName;
  final String? packageName;
  final String userName;

  final List<int> technicianIds;
  final List<String> technicianNames;
  final String? techniciansDisplay;

  final bool canBeRated;
  final bool isRated;

  BookingModel({
    required this.bookingType,
    required this.bookingDate,
    required this.bookingTime,
    this.notes,
    required this.id,
    required this.userId,
    this.serviceId,
    required this.poolTypeId,
    this.packageId,
    this.customLength,
    this.customWidth,
    this.customDepth,
    required this.status,
    this.adminNotes,
    this.nextMaintenanceDate,
    required this.reminderSent,
    required this.createdAt,
    this.updatedAt,
    this.serviceName,
    required this.poolTypeName,
    this.packageName,
    required this.userName,
    required this.technicianIds,
    required this.technicianNames,
    this.techniciansDisplay,
    required this.canBeRated,
    required this.isRated,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bookingType: json['booking_type'],
      bookingDate: json['booking_date'],
      bookingTime: json['booking_time'],
      notes: json['notes'],

      id: json['id'],
      userId: json['user_id'],
      serviceId: json['service_id'],
      poolTypeId: json['pool_type_id'],
      packageId: json['package_id'],

      customLength: (json['custom_length'] as num?)?.toDouble(),
      customWidth: (json['custom_width'] as num?)?.toDouble(),
      customDepth: (json['custom_depth'] as num?)?.toDouble(),

      status: json['status'],
      adminNotes: json['admin_notes'],
      nextMaintenanceDate: json['next_maintenance_date'],
      reminderSent: json['reminder_sent'] ?? false,

      createdAt: json['created_at'],
      updatedAt: json['updated_at'],

      serviceName: json['service_name'],
      poolTypeName: json['pool_type_name'],
      packageName: json['package_name'],
      userName: json['user_name'],

      technicianIds: List<int>.from(json['technician_ids'] ?? []),
      technicianNames: List<String>.from(json['technician_names'] ?? []),
      techniciansDisplay: json['technicians_display'],

      canBeRated: json['can_be_rated'] ?? false,
      isRated: json['is_rated'] ?? false,
    );
  }
}