

import 'package:plupool/features/reports/domain/entities/contact_statistcs_entity.dart';

class ContactStatisticsModel extends ContactStatistics {
  ContactStatisticsModel({
    required super.pendingReview,
    required super.inProgress,
    required super.resolved,
    required super.company,
  });

  factory ContactStatisticsModel.fromJson(Map<String, dynamic> json) {
    return ContactStatisticsModel(
      pendingReview: json['pending_review'],
      inProgress: json['in_progress'],
      resolved: json['resolved'],
      company: json['company'],
    );
  }
}