import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLocation(ServiceRequest request) async {
  final encodedLocation = Uri.encodeComponent(request.location);
  final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$encodedLocation');
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
