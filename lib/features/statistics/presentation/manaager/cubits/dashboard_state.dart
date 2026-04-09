import 'package:plupool/features/statistics/domain/entities/admin_statistics_entity.dart';



abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final AdminStatisticsEntity data;

  DashboardSuccess(this.data);
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}