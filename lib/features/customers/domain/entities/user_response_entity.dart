import 'package:plupool/features/customers/domain/entities/user_entity.dart';

class UsersResponseEntity {
  final int total;
  final int page;
  final int pageSize;
  final int totalPages;
  final List<UserEntity> users;

  const UsersResponseEntity({
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.users,
  });
}
