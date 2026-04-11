import 'package:plupool/features/store/domain/entities/stroe_statistics_entity.dart';

abstract class StoreStatisticsState {}

class StoreStatisticsInitial extends StoreStatisticsState {}

class StoreStatisticsLoading extends StoreStatisticsState {}

class StoreStatisticsSuccess extends StoreStatisticsState {
  final StoreStatisticsEntity data;

  StoreStatisticsSuccess(this.data);
}

class StoreStatisticsError extends StoreStatisticsState {
  final String message;

  StoreStatisticsError(this.message);
}