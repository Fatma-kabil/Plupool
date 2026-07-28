import 'package:plupool/features/myPool/domain/entities/company_pool_entity.dart';

abstract class CompanyPoolState {}

class CompanyPoolInitial extends CompanyPoolState {}

class CompanyPoolLoading extends CompanyPoolState {}

class CompanyPoolSuccess extends CompanyPoolState {
  final CompanyPoolEntity data;

  CompanyPoolSuccess(this.data);
}

class CompanyPoolFailure extends CompanyPoolState {
  final String message;

  CompanyPoolFailure(this.message);
}