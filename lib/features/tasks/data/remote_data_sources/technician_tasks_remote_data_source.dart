import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';

import '../models/task_model.dart';

class TechnicianTasksRemoteDataSource
    {
  final ApiService apiService;

  TechnicianTasksRemoteDataSource(this.apiService);

  
  Future<List<TaskModel>> getTasks({
    String? search,
    String? status,
    String? dateFrom,
    String? dateTo,
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/technician/tasks',
      queryParams: {
        if (search != null) "search": search,
        if (status != null) "status": status,
        if (dateFrom != null) "date_from": dateFrom,
        if (dateTo != null) "date_to": dateTo,
        "page": page,
        "page_size": pageSize,
      },
       options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Iiwicm9sZSI6InRlY2huaWNpYW4iLCJleHAiOjE3ODU1OTgzNTh9.hbPWdg5QfUFbbta1D-EVG1Pi4-jLxd4c6uEM6xarU8Y',
        },
      ),
    );

    return TaskModel.fromList(response.data["tasks"]);
  }


  Future<List<TaskModel>> getWeekTasks({
    String? weekStart,
    String? weekEnd,
    String? status,
    String? search,
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/technician/tasks/week',
      queryParams: {
        if (weekStart != null) "week_start": weekStart,
        if (weekEnd != null) "week_end": weekEnd,
        if (status != null) "status": status,
        if (search != null) "search": search,
        "page": page,
        "page_size": pageSize,
      },
       options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Iiwicm9sZSI6InRlY2huaWNpYW4iLCJleHAiOjE3ODU1OTgzNTh9.hbPWdg5QfUFbbta1D-EVG1Pi4-jLxd4c6uEM6xarU8Y',
        },
      ),
    );

    return TaskModel.fromList(response.data["tasks"]);
  }
}