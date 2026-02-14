import 'package:plupool/core/utils/functions/message_status_text.dart';

class ReportModel {
  final String customerName;
  final String techName;
  final MessageStatus status;
   final String date;
  final String time;

  ReportModel({ required this.date, required this.time, required this.customerName, required this.techName, required this.status});
}
