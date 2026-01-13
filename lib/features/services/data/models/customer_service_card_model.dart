import 'package:plupool/core/utils/functions/request_status.dart';

class CustomerServiceCardModel {
  final String orderno;
  final String service;
  final String techs;
  final RequestStatus statu;
  final DateTime date;

  CustomerServiceCardModel({required this.orderno, required this.service, required this.techs, required this.statu, required this.date});
}
