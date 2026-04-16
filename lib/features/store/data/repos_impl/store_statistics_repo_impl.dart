
import 'package:plupool/features/store/data/data_sources/store_statistics_remote_datasource.dart';
import 'package:plupool/features/store/domain/entities/stroe_statistics_entity.dart';

import '../../domain/repos/store_statistics_repo.dart';
import '../models/store_statistics_model.dart';

class StoreStatisticsRepoImpl implements StoreStatisticsRepo {
  final StoreStatisticsRemoteDataSource remoteDataSource;

  StoreStatisticsRepoImpl(this.remoteDataSource);

  @override
  Future<StoreStatisticsEntity> getStoreStatistics() async {
    try {
      // 👈 نجيب كل الداتا من الـ API
      final StoreStatisticsModel model = await remoteDataSource.getStoreStatistics();

      // 👈 نرجع الـ Entity بس للـ UI
      return StoreStatisticsEntity(
        rating: model.rating,
        totalOrders: model.totalOrders,
        totalProducts: model.totalProducts,
        activeOffers: model.activeOffers
      );
    } catch (e) {
      throw Exception('Failed to fetch store statistics: $e');
    }
  }
}