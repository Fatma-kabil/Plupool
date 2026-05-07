import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_response_entity.dart';


abstract class AdminUsersRepository {
  Future<UsersResponseEntity> getUsers({
    int page,
    int pageSize,
    String? search,
    String? role,
    bool? isActive,
    bool? isVerified,
    String sortBy,
    String sortOrder,
  });

  Future<UserDetailsEntity> getUserDetails(int id);

  Future<UserEntity> updateUser(int id, Map<String, dynamic> body);

  Future<void> deleteUser(int id);
}