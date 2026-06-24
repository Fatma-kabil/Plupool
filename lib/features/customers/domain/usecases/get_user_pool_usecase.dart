import 'package:plupool/features/customers/domain/entities/user_pool_entity.dart';
import 'package:plupool/features/customers/domain/repos/pool_repo.dart';

class GetUserPoolUseCase {
  final PoolRepository repo;

  GetUserPoolUseCase(this.repo);

  Future<UserPoolEntity> call(int userId) {
    return repo.getUserPool(userId);
  }
}