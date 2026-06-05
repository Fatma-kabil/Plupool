import 'package:plupool/features/customers/data/data_sources/admin_users_remote_data_source.dart';
import 'package:plupool/features/customers/data/mappers/user_deails_mapper.dart';
import 'package:plupool/features/customers/data/mappers/user_mapper.dart';
import 'package:plupool/features/customers/data/mappers/user_response_mapper.dart';
import 'package:plupool/features/customers/data/models/user_details_model.dart';
import 'package:plupool/features/customers/data/models/users_model.dart';
import 'package:plupool/features/customers/data/models/users_response_model.dart';
import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_response_entity.dart';
import 'package:plupool/features/customers/domain/repos/admin_domain_rapos.dart';


class AdminUsersRepositoryImpl implements AdminUsersRepository {
  final AdminUsersRemoteDataSource remote;

  AdminUsersRepositoryImpl(this.remote);

  @override
  Future<UsersResponseEntity> getUsers({
    int page = 1,
    int pageSize = 50,
    String? search,
    String? role,
    bool? isActive,
    bool? isVerified,
    String sortBy = "created_at",
    String sortOrder = "desc",
  }) async {
    final data = await remote.getUsers(
      page: page,
      pageSize: pageSize,
      search: search,
      role: role,
      isActive: isActive,
      isVerified: isVerified,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    return UsersResponseModel.fromJson(data).toEntity();
  }

  @override
  Future<UserDetailsEntity> getUserDetails(int id) async {
    final data = await remote.getUserDetails(id);

    return UserDetailsModel.fromJson(data).toEntity();
  }
 @override
  Future<UserEntity> addUser( Map<String, dynamic> body) async {
    final data = await remote.addUser(body);

    return UserModel.fromJson(data).toEntity();
  }
  @override
  Future<UserEntity> updateUser(int id, Map<String, dynamic> body) async {
    final data = await remote.updateUser(id, body);

    return UserModel.fromJson(data).toEntity();
  }

  @override
  Future<void> deleteUser(int id) async {
    await remote.deleteUser(id);
  }
}