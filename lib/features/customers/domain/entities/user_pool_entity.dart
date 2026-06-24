class UserPoolEntity {
  final String? poolTypeName;
  final String? systemType;

  final double? volumeLiters;
  final String? dimensions;

  final double? lengthMeters;
  final double? widthMeters;
  final double? depthMeters;

  final String? notes;
  final int? sourceTaskId;

  UserPoolEntity({
    this.poolTypeName,
    this.systemType,
    this.volumeLiters,
    this.dimensions,
    this.lengthMeters,
    this.widthMeters,
    this.depthMeters,
    this.notes,
    this.sourceTaskId,
  });
}