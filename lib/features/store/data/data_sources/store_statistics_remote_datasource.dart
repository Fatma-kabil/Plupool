import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import '../models/store_statistics_model.dart';

abstract class StoreStatisticsRemoteDataSource {
  Future<StoreStatisticsModel> getStoreStatistics();
}

class StoreStatisticsRemoteDataSourceImpl implements StoreStatisticsRemoteDataSource {
  final ApiService apiService;

  StoreStatisticsRemoteDataSourceImpl(this.apiService);

  @override
  Future<StoreStatisticsModel> getStoreStatistics() async {
    final response = await apiService.get(Endpoints.adminStoreStatistics);

  
      return StoreStatisticsModel.fromJson(response.data);
    
  }
}