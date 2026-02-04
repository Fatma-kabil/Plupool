import 'package:plupool/core/utils/functions/message_status_text.dart';

class ContactUsModel {
  final DateTime messageDate;
  final MessageStatus status;
  final String companyName;
  final String companyRes;
  final String projectType;
  final String phone;
  final String message;

  ContactUsModel({
    required this.message,
    required this.messageDate,
    required this.status,
    required this.companyName,
    required this.companyRes,
    required this.projectType,
    required this.phone,
  });
}
