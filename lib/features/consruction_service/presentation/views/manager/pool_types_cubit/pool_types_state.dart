import 'package:plupool/features/consruction_service/domain/entities/pool_type_entity.dart';

class PoolTypesState {}

class PoolTypesInitial extends PoolTypesState {}

class PoolTypesLoading extends PoolTypesState {}

class PoolTypesSuccess extends PoolTypesState {
  final List<PoolTypeEntity> poolTypes;

  PoolTypesSuccess(this.poolTypes);
}

class PoolTypesFailure extends PoolTypesState {
  final String message;

  PoolTypesFailure(this.message);
}