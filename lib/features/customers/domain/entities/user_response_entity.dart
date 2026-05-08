import 'package:plupool/features/customers/domain/entities/user_entity.dart';

class UsersResponseEntity {
  final int total;
  // ignore: non_constant_identifier_names
  final int? activeTech;
  final int? inactiveTeck;
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
    this.activeTech,
    this.inactiveTeck
  });
}
