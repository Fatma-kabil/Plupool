import 'package:plupool/features/customers/data/models/user_contact_message_model.dart';
import 'package:plupool/features/customers/data/models/user_details_model.dart';
import 'package:plupool/features/customers/data/models/users_booking_model.dart';
import 'package:plupool/features/customers/data/models/users_order_model.dart';
import 'package:plupool/features/customers/data/models/users_project_model.dart';
import 'package:plupool/features/customers/data/models/users_rating_models.dart';
import 'package:plupool/features/customers/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_contact_message_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/customers/data/mappers/user_mapper.dart';
import 'package:plupool/features/customers/domain/entities/user_order_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_project_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_rating_entity.dart';
extension UserDetailsMapper on UserDetailsModel {
  UserDetailsEntity toEntity() {
    return UserDetailsEntity(
      user: user.toEntity(),
      statistics: statistics,
      bookings: bookings.map((e) => e.toEntity()).toList(),
      projects: projects.map((e) => e.toEntity()).toList(),
      orders: orders.map((e) => e.toEntity()).toList(),
      ratings: ratings.map((e) => e.toEntity()).toList(),
      contactMessages: contactMessages.map((e) => e.toEntity()).toList(),
    );
  }
}
extension UsersBookingMapper on UsersBookingModel {
  UserBookingEntity toEntity() {
    return UserBookingEntity(
      id: id,
      bookingType: bookingType,
      status: status,
      bookingDate: bookingDate,
      bookingTime: bookingTime,
      serviceName: serviceName,
      createdAt: createdAt,
    );
  }
}

/// =========================
/// ORDERS MAPPER
/// =========================

extension UserOrderMapper on UserOrderModel {
  UserOrderEntity toEntity() {
    return UserOrderEntity(
      id: id,
      orderNumber: orderNumber,
      status: status,
      totalAmount: totalAmount,
      grandTotal: grandTotal,
      paymentMethod: paymentMethod,
      createdAt: createdAt,
    );
  }
}

/// =========================
/// RATINGS MAPPER
/// =========================

extension UsersRatingMapper on UsersRatingModel {
  UserRatingEntity toEntity() {
    return UserRatingEntity(
      id: id,
      rating: rating,
      content: content,
      status: status,
      serviceName: serviceName,
      createdAt: createdAt,
    );
  }
}
/// =========================
/// CONTACT MESSAGES MAPPER
/// =========================

extension UsersContactMessageMapper
    on UsersContactMessageModel {
  UserContactMessageEntity toEntity() {
    return UserContactMessageEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      message: message,
      status: status,
      senderRole: senderRole,
      createdAt: createdAt,
    );
  }
}


/// =========================
/// PROJECTS MAPPER
/// =========================

extension UsersProjectMapper on UsersProjectModel {
  UserProjectEntity toEntity() {
    return UserProjectEntity(
      id: id,
      nameAr: nameAr,
      projectType: projectType,
      status: status,
      startDate: startDate,
      progressPercentage: progressPercentage,
      createdAt: createdAt,
    );
  }
}