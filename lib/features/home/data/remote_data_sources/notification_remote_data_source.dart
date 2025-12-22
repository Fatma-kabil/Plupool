
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import '../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications(int userId);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiService apiService;

  NotificationRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<NotificationModel>> getNotifications(int userId) async {
    final response = await apiService.get(
      Endpoints.notifications,
      queryParams: {'user_id': userId},
    );

    final List<dynamic> data = response.data;

    return data.map((json) => NotificationModel.fromJson(json)).toList();
  }
}
