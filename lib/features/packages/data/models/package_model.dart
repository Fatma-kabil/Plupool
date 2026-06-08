import '../../domain/entities/package_entity.dart';
import 'subscriber_model.dart';

class PackageModel extends PackageEntity {
  PackageModel({
    required super.id,
    required super.nameAr,
    super.nameEn,
    super.descriptionAr,
    super.descriptionEn,
    required super.duration,
    required super.price,
    required super.visitsCount,
    required super.completedVisits,
    super.status,
    super.displayDate,
    required super.progress,
    required super.subscribersCount,
    required super.subscribers,
    required super.createdAt,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      duration: json['duration'] ?? '',
      price: json['price'] ?? 0,
      visitsCount: json['visits_count'] ?? 0,
      completedVisits: json['completed_visits'] ?? 0,
      status: json['status'],
      displayDate: json['display_date'],
      progress:
          (json['progress_percentage'] as num?)?.toDouble() ?? 0,
      subscribersCount: json['subscribers_count'] ?? 0,
      subscribers: (json['subscribers'] as List? ?? [])
          .map((e) => SubscriberModel.fromJson(e))
          .toList(),
      createdAt: json['created_at'] ?? '',
    );
  }
}