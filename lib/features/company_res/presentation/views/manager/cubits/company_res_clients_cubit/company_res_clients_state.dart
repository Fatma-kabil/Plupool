import 'package:plupool/features/company_res/domain/entities/client_entity.dart';

class CompanyResClientsState {
  final bool isLoading;
  final List<ClientEntity> clients;
  final String? error;

  CompanyResClientsState({
    this.isLoading = false,
    this.clients = const [],
    this.error,
  });

  CompanyResClientsState copyWith({
    bool? isLoading,
    List<ClientEntity>? clients,
    String? error,
  }) {
    return CompanyResClientsState(
      isLoading: isLoading ?? this.isLoading,
      clients: clients ?? this.clients,
      error: error,
    );
  }
}