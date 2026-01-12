import 'package:plupool/features/home/domain/entities/request_status.dart';

class MessageModel {
  final String role;
  final String name;
  final String message;
  final RequestStatus status;
  final bool files;

  MessageModel({required this.role, required this.name, required this.message, required this.status,  this.files=false});
}
