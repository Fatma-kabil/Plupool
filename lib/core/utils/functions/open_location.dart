import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLocation(BuildContext context, String? location) async {
  if (location == null || location.isEmpty) {
    showCustomSnackBar(
      context: context,
      message: "❗ لم يتم العثور على موقع صالح",
    );
    return;
  }

  final encodedLocation = Uri.encodeComponent(location);
  final url = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$encodedLocation',
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    showCustomSnackBar(
      context: context,
      message: "❌ لا يمكن فتح الرابط: $url",
    );
  }
}
