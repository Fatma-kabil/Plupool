import 'client_entity.dart';
import 'pool_profile_entity.dart';
import 'task_entity.dart';
import 'water_quality_entity.dart';

class TaskDetailsEntity {
  final TaskEntity task;

  final ClientEntity client;

  final PoolProfileEntity poolProfile;

  final WaterQualityEntity waterQuality;

  const TaskDetailsEntity({
    required this.task,
    required this.client,
    required this.poolProfile,
    required this.waterQuality,
  });
}