class ReadingRequestEntity {
  final int? visitNumber;
  final String? status;
  final double? chlorinePpm;
  final double? phLevel;
  final double? temperatureC;
  final String? notes;
  final int? technicianId;

  const ReadingRequestEntity({
     this.visitNumber,
     this.status,
     this.chlorinePpm,
     this.phLevel,
    this.temperatureC,
    this.notes,
    this.technicianId,
  });
}