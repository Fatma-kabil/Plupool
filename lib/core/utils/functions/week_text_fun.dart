 String weekText(int count) {
    if (count == 0) return '0 أسبوع';

    if (count == 1) return 'أسبوع';

    if (count == 2) return 'أسبوعين';

    if (count >= 3 && count <= 10) {
      return '$count أسابيع';
    }

    return '$count أسبوع';
  }
