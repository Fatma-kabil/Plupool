import 'package:plupool/features/packages/domain/entities/subscriber_entity.dart';

class PackageEntity {
  final int id;
  final String nameAr;
  final String? nameEn;

  final String? descriptionAr;
  final String? descriptionEn;

  final String duration;
  final int price;

  final int visitsCount;
  final int completedVisits;

  final String? status;
  final String? displayDate;

  final double progress;

  final int subscribersCount;

  final List<SubscriberEntity> subscribers;

  final String createdAt;

  PackageEntity({
    required this.id,
    required this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    required this.duration,
    required this.price,
    required this.visitsCount,
    required this.completedVisits,
    this.status,
    this.displayDate,
    required this.progress,
    required this.subscribersCount,
    required this.subscribers,
    required this.createdAt,
  });
}