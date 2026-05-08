import 'package:plupool/features/customers/data/models/users_response_model.dart';
import 'package:plupool/features/customers/domain/entities/user_response_entity.dart';
import 'package:plupool/features/customers/data/mappers/user_mapper.dart';
extension UsersResponseMapper on UsersResponseModel {
  UsersResponseEntity toEntity() {
    return UsersResponseEntity(
      total: total,
      page: page,
      pageSize: pageSize,
      totalPages: totalPages,
      users: users.map((e) => e.toEntity()).toList(),
      activeTech: activeTech,
      inactiveTeck: inactiveTech
    );
  }
}