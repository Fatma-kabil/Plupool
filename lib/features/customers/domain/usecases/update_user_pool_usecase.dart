import 'package:plupool/features/customers/domain/entities/user_pool_entity.dart';
import 'package:plupool/features/customers/domain/repos/pool_repo.dart';

class UpdateUserPoolUseCase {
  final PoolRepository repo;

  UpdateUserPoolUseCase(this.repo);

  Future<UserPoolEntity> call({
    required int userId,
    required Map<String, dynamic> body,
  }) {
    return repo.updateUserPool(
      userId: userId,
      body: body,
    );
  }
}