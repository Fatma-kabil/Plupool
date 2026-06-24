import 'package:plupool/features/customers/domain/entities/user_pool_entity.dart';

abstract class PoolRepository {
  Future<UserPoolEntity> getUserPool(int userId);

  Future<UserPoolEntity> updateUserPool({
    required int userId,
    required Map<String, dynamic> body,
  });
}