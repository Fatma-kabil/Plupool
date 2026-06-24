import 'package:plupool/features/customers/data/data_sources/pool_remote_data_source.dart';
import 'package:plupool/features/customers/domain/entities/user_pool_entity.dart';
import 'package:plupool/features/customers/domain/repos/pool_repo.dart';

class PoolRepositoryImpl implements PoolRepository {
  final PoolRemoteDataSource remote;

  PoolRepositoryImpl(this.remote);

  @override
  Future<UserPoolEntity> getUserPool(int userId) {
    return remote.getUserPool(userId);
  }

 @override
Future<UserPoolEntity> updateUserPool({
  required int userId,
  required Map<String, dynamic> body,
}) {
  return remote.updateUserPool(
    userId: userId,
    body: body,
  );
}
}