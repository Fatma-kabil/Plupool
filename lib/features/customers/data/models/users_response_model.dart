import 'package:plupool/features/customers/data/models/users_model.dart';

class UsersResponseModel {
  final int total;
  final int page;
  final int pageSize;
  final int totalPages;
  final List<UserModel> users;

  final int? activeTech;
  final int? inactiveTech;

  UsersResponseModel({
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.users,
    this.activeTech,
    this.inactiveTech,
  });

  factory UsersResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final usersList =
        json['users'] ??
        json['technicians'] ??
        json['companies'] ??
        [];

    return UsersResponseModel(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      pageSize: json['page_size'] ?? 10,
      totalPages: json['total_pages'] ?? 1,

      users: List<UserModel>.from(
        (usersList as List).map(
          (e) => UserModel.fromJson(e),
        ),
      ),

      activeTech: json['active_technicians'],
      inactiveTech: json['inactive_technicians'],
    );
  }
}