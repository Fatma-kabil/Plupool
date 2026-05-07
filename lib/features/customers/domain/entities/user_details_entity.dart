import 'package:plupool/features/customers/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_contact_message_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_order_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_project_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_rating_entity.dart';

class UserDetailsEntity {
  final UserEntity user;
  final Map<String, dynamic> statistics;
  final List<UserBookingEntity> bookings;
  final List<UserProjectEntity> projects;
  final List<UserOrderEntity> orders;
  final List<UserRatingEntity> ratings;
  final List<UserContactMessageEntity> contactMessages;

  const UserDetailsEntity({
    required this.user,
    required this.statistics,
    required this.bookings,
    required this.projects,
    required this.orders,
    required this.ratings,
    required this.contactMessages,
  });
}