class PoolDetailsEntity {
  final int profileId;
  final int sourceTaskId;

  final String nickname;
  final int poolTypeId;
  final String poolTypeName;

  final String systemType;

  final double volumeLiters;

  final String dimensions;

  final double lengthMeters;
  final double widthMeters;
  final double depthMeters;

  final String? notes;

  final String updatedAt;

  const PoolDetailsEntity({
    required this.profileId,
    required this.sourceTaskId,
    required this.nickname,
    required this.poolTypeId,
    required this.poolTypeName,
    required this.systemType,
    required this.volumeLiters,
    required this.dimensions,
    required this.lengthMeters,
    required this.widthMeters,
    required this.depthMeters,
    this.notes,
    required this.updatedAt,
  });
}