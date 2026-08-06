class NextVisitEntity {
  final String title;
  final String date;
  final String time;
  final String weekdayAr;
  final bool reminder;
  final int reminderDaysBefore;

  const NextVisitEntity({
    required this.title,
    required this.date,
    required this.time,
    required this.weekdayAr,
    required this.reminder,
    required this.reminderDaysBefore,
  });
}