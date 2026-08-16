import 'package:plupool/features/company_res/domain/entities/client_entity.dart';
import 'package:plupool/features/company_res/domain/entities/create_client_response_entity.dart'
    hide ClientEntity;

class CompanyResClientsState {
  // =========================
  // GET CLIENTS
  // =========================

  final bool isLoading;
  final List<ClientEntity> clients;

  /// Error الخاص بجلب العملاء
  final String? error;

  // =========================
  // CREATE CLIENT
  // =========================

  final bool isCreating;

  /// Error الخاص بإنشاء العميل
  final String? createError;

  /// بيانات العميل الذي تم إنشاؤه
  final CreateClientResponseEntity? createdClient;

  /// نجاح عملية الإنشاء
  final bool createSuccess;

  // =========================
  // DELETE CLIENT
  // =========================

  final bool isDeleting;

  /// Error الخاص بحذف العميل
  final String? deleteError;

  /// نجاح عملية الحذف
  final bool deleteSuccess;

  // =========================
  // FILTERS
  // =========================

  final String? search;
  final bool? isActive;

  CompanyResClientsState({
    this.isLoading = false,
    this.isCreating = false,
    this.isDeleting = false,

    this.clients = const [],

    this.error,

    this.createError,
    this.createdClient,
    this.createSuccess = false,

    this.deleteError,
    this.deleteSuccess = false,

    this.search,
    this.isActive,
  });

  CompanyResClientsState copyWith({
    // GET
    bool? isLoading,
    List<ClientEntity>? clients,
    String? error,

    // CREATE
    bool? isCreating,
    String? createError,
    CreateClientResponseEntity? createdClient,
    bool? createSuccess,

    // DELETE
    bool? isDeleting,
    String? deleteError,
    bool? deleteSuccess,

    // FILTERS
    String? search,
    bool? isActive,

    // CLEAR
    bool clearError = false,
    bool clearCreateError = false,
    bool clearCreatedClient = false,
    bool clearDeleteError = false,
  }) {
    return CompanyResClientsState(
      // =========================
      // GET
      // =========================

      isLoading: isLoading ?? this.isLoading,

      clients: clients ?? this.clients,

      error: clearError
          ? null
          : error ?? this.error,

      // =========================
      // CREATE
      // =========================

      isCreating: isCreating ?? this.isCreating,

      createError: clearCreateError
          ? null
          : createError ?? this.createError,

      createdClient: clearCreatedClient
          ? null
          : createdClient ?? this.createdClient,

      createSuccess: createSuccess ?? this.createSuccess,

      // =========================
      // DELETE
      // =========================

      isDeleting: isDeleting ?? this.isDeleting,

      deleteError: clearDeleteError
          ? null
          : deleteError ?? this.deleteError,

      deleteSuccess: deleteSuccess ?? this.deleteSuccess,

      // =========================
      // FILTERS
      // =========================

      search: search ?? this.search,
      isActive: isActive ?? this.isActive,
    );
  }
}