import '../../domain/entities/next_visit_entity.dart';

class NextVisitModel extends NextVisitEntity {
  const NextVisitModel({
    required super.date,
    required super.time,
    required super.reminder,
  });

  factory NextVisitModel.fromJson(Map<String, dynamic> json) {
    return NextVisitModel(
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      reminder: json['reminder'] ?? false,
    );
  }

  NextVisitEntity toEntity() => this;
}