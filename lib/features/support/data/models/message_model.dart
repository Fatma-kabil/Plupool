import 'package:plupool/core/utils/functions/message_status_text.dart';

class MessageModel {
  final String role;
  final String name;
  final String message;
  final MessageStatus status;
  final bool files;

  MessageModel({required this.role, required this.name, required this.message, required this.status,  this.files=false});
}
