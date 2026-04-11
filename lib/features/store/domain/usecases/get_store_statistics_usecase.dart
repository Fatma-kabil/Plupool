
import 'package:plupool/features/store/domain/entities/stroe_statistics_entity.dart';

import '../repos/store_statistics_repo.dart';

class GetStoreStatisticsUseCase {
  final StoreStatisticsRepo repository;

  GetStoreStatisticsUseCase(this.repository);

  Future<StoreStatisticsEntity> call() async {
    return await repository.getStoreStatistics();
  }
}