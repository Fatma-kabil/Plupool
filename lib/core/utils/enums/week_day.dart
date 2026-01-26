enum WeekDay {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

String weekDayLabel(WeekDay day) {
  switch (day) {
    case WeekDay.sunday:
      return 'الأحد';
    case WeekDay.monday:
      return 'الاثنين';
    case WeekDay.tuesday:
      return 'الثلاثاء';
    case WeekDay.wednesday:
      return 'الأربعاء';
    case WeekDay.thursday:
      return 'الخميس';
    case WeekDay.friday:
      return 'الجمعة';
    case WeekDay.saturday:
      return 'السبت';
  }
}
