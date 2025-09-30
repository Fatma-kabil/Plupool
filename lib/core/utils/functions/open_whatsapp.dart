import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp({
  String phone = "201124974377", // ✅ بصيغة دولية من غير +
  
}) async {
  final Uri whatsappUri = Uri.parse("https://wa.me/$phone");

  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  } else {
    throw "لا يمكن فتح واتساب";
  }
}
