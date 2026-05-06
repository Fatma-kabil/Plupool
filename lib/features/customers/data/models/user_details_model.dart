import 'package:plupool/features/customers/data/models/user_contact_message_model.dart';
import 'package:plupool/features/customers/data/models/users_booking_model.dart';
import 'package:plupool/features/customers/data/models/users_order_model.dart';
import 'package:plupool/features/customers/data/models/users_project_model.dart';
import 'package:plupool/features/customers/data/models/users_rating_models.dart';
import 'package:plupool/features/profile/data/models/user_model.dart';

class UserDetailsModel {
  final UserModel user;
  final Map<String, dynamic> statistics;
  final List<UsersBookingModel> bookings;
  final List<UsersProjectModel> projects;
  final List<UserOrderModel> orders;
  final List<UsersRatingModel> ratings;
  final List<UsersContactMessageModel> contactMessages;

  UserDetailsModel({
    required this.user,
    required this.statistics,
    required this.bookings,
    required this.projects,
    required this.orders,
    required this.ratings,
    required this.contactMessages,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      user: UserModel.fromJson(json['user']),
      statistics: json['statistics'] ?? {},
      bookings: (json['bookings'] as List)
          .map((e) => UsersBookingModel.fromJson(e))
          .toList(),
      projects: (json['projects'] as List)
          .map((e) => UsersProjectModel.fromJson(e))
          .toList(),
      orders: (json['orders'] as List)
          .map((e) => UserOrderModel.fromJson(e))
          .toList(),
      ratings: (json['ratings'] as List)
          .map((e) => UsersRatingModel.fromJson(e))
          .toList(),
      contactMessages: (json['contact_messages'] as List)
          .map((e) => UsersContactMessageModel.fromJson(e))
          .toList(),
    );
  }
}