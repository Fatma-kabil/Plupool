import 'package:plupool/features/company_res/domain/entities/client_entity.dart';
import 'package:plupool/features/company_res/domain/entities/create_client_response_entity.dart' hide ClientEntity;

class CompanyResClientsState {
  final bool isLoading;
  final bool isCreating;

  final List<ClientEntity> clients;

  /// Error الخاص بجلب العملاء
  final String? error;

  /// Error الخاص بإنشاء العميل
  final String? createError;

  /// بيانات العميل الذي تم إنشاؤه
  final CreateClientResponseEntity? createdClient;

  /// نجاح عملية الإنشاء
  final bool createSuccess;

  /// الفلاتر الحالية
  final String? search;
  final bool? isActive;

  CompanyResClientsState({
    this.isLoading = false,
    this.isCreating = false,
    this.clients = const [],
    this.error,
    this.createError,
    this.createdClient,
    this.createSuccess = false,
    this.search,
    this.isActive,
  });

  CompanyResClientsState copyWith({
    bool? isLoading,
    bool? isCreating,
    List<ClientEntity>? clients,
    String? error,
    String? createError,
    CreateClientResponseEntity? createdClient,
    bool? createSuccess,
    String? search,
    bool? isActive,

    bool clearError = false,
    bool clearCreateError = false,
    bool clearCreatedClient = false,
  }) {
    return CompanyResClientsState(
      isLoading: isLoading ?? this.isLoading,
      isCreating: isCreating ?? this.isCreating,

      clients: clients ?? this.clients,

      error: clearError
          ? null
          : error ?? this.error,

      createError: clearCreateError
          ? null
          : createError ?? this.createError,

      createdClient: clearCreatedClient
          ? null
          : createdClient ?? this.createdClient,

      createSuccess: createSuccess ?? this.createSuccess,

      search: search ?? this.search,
      isActive: isActive ?? this.isActive,
    );
  }
}