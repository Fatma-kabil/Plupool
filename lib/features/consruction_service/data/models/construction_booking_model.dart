import '../../domain/entities/construction_booking_entity.dart';

class ConstructionBookingModel extends ConstructionBookingEntity {
  ConstructionBookingModel({
    required super.bookingType,
    required super.bookingDate,
    required super.bookingTime,
    required super.poolTypeId,
    super.customLength,
    super.customWidth,
    super.customDepth,
    super.notes,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      "booking_type": bookingType,
      "booking_date": bookingDate,
      "booking_time": bookingTime,
      "pool_type_id": poolTypeId,
    };

    if (customLength != null) {
      data["custom_length"] = customLength;
    }

    if (customWidth != null) {
      data["custom_width"] = customWidth;
    }

    if (customDepth != null) {
      data["custom_depth"] = customDepth;
    }

    if (notes != null && notes!.trim().isNotEmpty) {
      data["notes"] = notes;
    }

    return data;
  }
}