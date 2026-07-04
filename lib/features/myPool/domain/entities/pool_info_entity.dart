class PoolInfoEntity {
  final String poolTypeName;
  final String systemType;
  final double volumeLiters;
  final String dimensions;
  final double lengthMeters;
  final double widthMeters;
  final double depthMeters;
  final String notes;
  final int sourceTaskId;

  const PoolInfoEntity({
    required this.poolTypeName,
    required this.systemType,
    required this.volumeLiters,
    required this.dimensions,
    required this.lengthMeters,
    required this.widthMeters,
    required this.depthMeters,
    required this.notes,
    required this.sourceTaskId,
  });
}