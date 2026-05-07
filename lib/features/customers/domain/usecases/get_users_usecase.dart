import 'package:plupool/features/customers/domain/entities/user_response_entity.dart';
import 'package:plupool/features/customers/domain/repos/admin_domain_rapos.dart';

class GetUsersUseCase {
  final AdminUsersRepository repo;

  GetUsersUseCase(this.repo);

  Future<UsersResponseEntity> call({
    int page = 1,
    int pageSize = 50,
    String? search,
    String? role,
    bool? isActive,
    bool? isVerified,
    String sortBy = "created_at",
    String sortOrder = "desc",
  }) {
    return repo.getUsers(
      page: page,
      pageSize: pageSize,
      search: search,
      role: role,
      isActive: isActive,
      isVerified: isVerified,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }
}