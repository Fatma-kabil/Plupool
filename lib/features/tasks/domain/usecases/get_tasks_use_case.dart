import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';
import 'package:plupool/features/tasks/domain/repos/technician_tasks_repo.dart';


class GetTasksUseCase {
  final TechnicianTasksRepo repository;

  GetTasksUseCase(this.repository);

 Future<Either<Failure, List<TaskEntity>>> call({
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
}) {
  return repository.getTasks(
    search: search,
    status: status,
    priorities: priorities,
    serviceTypes: serviceTypes,
    locations: locations,
    dateFrom: dateFrom,
    dateTo: dateTo,
    weekOnly: weekOnly,
    page: page,
    pageSize: pageSize,
  );

  }
}