import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/tasks/data/models/task_details_model.dart';
import 'package:plupool/features/tasks/data/models/water_quality_history_model.dart';

import '../models/task_model.dart';

class TechnicianTasksRemoteDataSource {
  final ApiService apiService;

  TechnicianTasksRemoteDataSource(this.apiService);

  Future<List<TaskModel>> getTasks({
    String? search,
    List<String>? status,
    List<String>? priorities,
    List<String>? serviceTypes,
    List<String>? locations,
    String? dateFrom,
    String? dateTo,
    bool weekOnly = false,
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/technician/tasks',
      queryParams: {
        if (search != null && search.isNotEmpty) "search": search,

        if (status != null && status.isNotEmpty) "status": status,

        if (priorities != null && priorities.isNotEmpty) "priority": priorities,

        if (serviceTypes != null && serviceTypes.isNotEmpty)
          "service_type": serviceTypes,

        if (locations != null && locations.isNotEmpty) "location": locations,

        if (dateFrom != null) "date_from": dateFrom,
        if (dateTo != null) "date_to": dateTo,

        "week_only": weekOnly,
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

  Future<TaskDetailsModel> getTaskDetails({required int taskId}) async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/technician/tasks/$taskId',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzMiIsImV4cCI6MTc4NDQ4NDI0OH0.wK0pRd_mySHLRGZ8hnF_gpGhhqUI0AMgjj-AIiI9uj0',
        },
      ),
    );

    return TaskDetailsModel.fromJson(response.data);
  }

  Future<TaskDetailsModel> completeTaskWithReading({
    required int taskId,
    required WaterQualityHistoryModel request,
  }) async {
    final response = await apiService.post(
      "${Endpoints.baseUrl}/technician/tasks/$taskId/complete-with-reading",
      data: request.toJson(),
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Iiwicm9sZSI6InRlY2huaWNpYW4iLCJleHAiOjE3ODU1OTgzNTh9.hbPWdg5QfUFbbta1D-EVG1Pi4-jLxd4c6uEM6xarU8Y',
        },
      ),
    );

    return TaskDetailsModel.fromJson(response.data);
  }
}
