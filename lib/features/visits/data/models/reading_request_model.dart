import 'package:plupool/features/visits/domain/entities/reading_request_entity.dart';

class ReadingRequestModel extends ReadingRequestEntity {
  const ReadingRequestModel({
    super.visitNumber,
    super.status,
    super.chlorinePpm,
    super.phLevel,
    super.temperatureC,
    super.notes,
    super.technicianId,
  });

  Map<String, dynamic> toJson() {
    return {
      if (visitNumber != null)
        'visit_number': visitNumber,

      if (status != null)
        'status': status,

      if (chlorinePpm != null)
        'chlorine_ppm': chlorinePpm,

      if (phLevel != null)
        'ph_level': phLevel,

      if (temperatureC != null)
        'temperature_c': temperatureC,

      if (notes != null)
        'notes': notes,

      if (technicianId != null)
        'technician_id': technicianId,
    };
  }

  factory ReadingRequestModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ReadingRequestModel(
      visitNumber: json['visit_number'] as int?,
      status: json['status'] as String?,
      chlorinePpm: json['chlorine_ppm'] != null
          ? (json['chlorine_ppm'] as num).toDouble()
          : null,
      phLevel: json['ph_level'] != null
          ? (json['ph_level'] as num).toDouble()
          : null,
      temperatureC: json['temperature_c'] != null
          ? (json['temperature_c'] as num).toDouble()
          : null,
      notes: json['notes'] as String?,
      technicianId: json['technician_id'] as int?,
    );
  }
}