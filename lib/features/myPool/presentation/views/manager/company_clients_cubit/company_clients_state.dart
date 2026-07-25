import 'package:plupool/features/myPool/domain/entities/clients_response_entity.dart';

abstract class CompanyClientsState {}

class CompanyClientsInitial extends CompanyClientsState {}

class GetClientsLoading extends CompanyClientsState {}

class GetClientsSuccess extends CompanyClientsState {
  final ClientsResponseEntity response;

  GetClientsSuccess(this.response);
}
class SearchClientsLoading extends CompanyClientsState {}
class GetClientsFailure extends CompanyClientsState {
  final String message;

  GetClientsFailure(this.message);
}
