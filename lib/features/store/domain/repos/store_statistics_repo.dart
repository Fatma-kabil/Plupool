

import 'package:plupool/features/store/domain/entities/stroe_statistics_entity.dart';

abstract class StoreStatisticsRepo {
  /// Get store statistics
  Future<StoreStatisticsEntity> getStoreStatistics();
}