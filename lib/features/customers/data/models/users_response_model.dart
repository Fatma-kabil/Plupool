import 'package:plupool/features/profile/data/models/user_model.dart';

class UsersResponseModel {
  final int total;
  final int page;
  final int pageSize;
  final int totalPages;
  final List<UserModel> users;

  UsersResponseModel({
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.users,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      total: json['total'],
      page: json['page'],
      pageSize: json['page_size'],
      totalPages: json['total_pages'],
      users: (json['users'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList(),
    );
  }
}