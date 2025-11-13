
  /// ⏰ دالة لتحويل الوقت العربي إلى TimeOfDay ثم DateTime للمقارنة
  DateTime parseTime(String timeStr) {
    // مثال: "9:00 ص" أو "1:00 م"
    final parts = timeStr.split(' ');
    final time = parts[0];
    final period = parts.length > 1 ? parts[1] : '';
    final hourMinute = time.split(':');
    int hour = int.parse(hourMinute[0]);
    int minute = int.parse(hourMinute[1]);

    if (period.contains('م') && hour < 12) hour += 12; // م = PM
    if (period.contains('ص') && hour == 12) hour = 0; // 12 ص = 00

    return DateTime(0, 1, 1, hour, minute);
  }
