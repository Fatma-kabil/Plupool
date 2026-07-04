import 'package:equatable/equatable.dart';
import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';

class UserServicesState extends Equatable {
  final bool isLoading;
  final List<UserServiceEntity> services;
  final String? errorMessage;

  const UserServicesState({
    this.isLoading = false,
    this.services = const [],
    this.errorMessage,
  });

  UserServicesState copyWith({
    bool? isLoading,
    List<UserServiceEntity>? services,
    String? errorMessage,
  }) {
    return UserServicesState(
      isLoading: isLoading ?? this.isLoading,
      services: services ?? this.services,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        services,
        errorMessage,
      ];
}