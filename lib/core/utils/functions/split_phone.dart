import 'package:country_picker/country_picker.dart';

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


PhoneData splitPhone2(String phone) {
  phone = phone.trim();

  // ترتيب الأكواد من الأطول للأقصر علشان ميختارش +2 قبل +20
  final countries = CountryService().getAll().toList()
    ..sort((a, b) => b.phoneCode.length.compareTo(a.phoneCode.length));

  for (final country in countries) {
    final code = '+${country.phoneCode}';

    if (phone.startsWith(code)) {
      return PhoneData(
        countryCode: code,
        number: phone.substring(code.length).trim(),
      );
    }
  }

  // لو ملقاش كود دولة
  return PhoneData(
    countryCode: '+20',
    number: phone.replaceFirst('+20', '').trim(),
  );
}
String reverseNumbers(String value) {
  return value.split('').reversed.join();
}
String getCountryCodeDigits(String countryCode) {
  return countryCode.replaceAll('+', '');
}