import '../../domain/entities/task_details_entity.dart';
import 'client_model.dart';
import 'pool_profile_model.dart';
import 'task_model.dart';
import 'water_quality_model.dart';

class TaskDetailsModel extends TaskDetailsEntity {
  const TaskDetailsModel({
    required super.task,
    required super.client,
    required super.poolProfile,
    required super.waterQuality,
  });

  factory TaskDetailsModel.fromJson(Map<String, dynamic> json) {
    return TaskDetailsModel(
      task: TaskModel.fromJson(json['task'] ?? {}),
      client: ClientModel.fromJson(json['client'] ?? {}),
      poolProfile: PoolProfileModel.fromJson(json['pool_profile'] ?? {}),
      waterQuality: WaterQualityModel.fromJson(json['water_quality'] ?? {}),
    );
  }
}