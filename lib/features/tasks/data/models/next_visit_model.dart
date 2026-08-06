import '../../domain/entities/next_visit_entity.dart';

class NextVisitModel extends NextVisitEntity {
  const NextVisitModel({
    required super.title,
    required super.date,
    required super.time,
    required super.weekdayAr,
    required super.reminder,
    required super.reminderDaysBefore,
  });

  factory NextVisitModel.fromJson(Map<String, dynamic> json) {
    return NextVisitModel(
      title: json['title'],
      date: json['date'],
      time: json['time'],
      weekdayAr: json['weekday_ar'],
      reminder: json['reminder'],
      reminderDaysBefore: json['reminder_days_before'],
    );
  }
}