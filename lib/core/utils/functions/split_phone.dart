/// Model بسيط نرجّع بيه الداتا
class PhoneData {
  final String countryCode;
  final String number;

  const PhoneData({
    required this.countryCode,
    required this.number,
  });
}

/// يفصل Country Code عن الرقم
PhoneData splitPhone(String phone) {
  phone = phone.trim();

  String countryCode = '+20'; // fallback
  String number = phone;

  if (phone.contains(' ')) {
    final parts = phone.split(' ');
    countryCode = parts.first.trim();
    number = parts.sublist(1).join(' ').trim();
  } else if (phone.startsWith('+')) {
    final match = RegExp(r'^(\+\d+)').firstMatch(phone);
    if (match != null) {
      countryCode = match.group(1)!;
      number = phone.replaceFirst(countryCode, '').trim();
    }
  }

  return PhoneData(
    countryCode: countryCode,
    number: number,
  );
}

/// دمج الرقم قبل الإرسال للسيرفر
String mergePhone({
  required String countryCode,
  required String number,
}) {
  return '$countryCode ${number.trim()}';
}
