import 'package:plupool/features/orders/domain/entities/order_status.dart';

class OrderCardModel {
  final int orderNo;
  final DateTime date;
  final OrderStatus satus;
  final String? note;

  OrderCardModel({required this.orderNo, required this.date, required this.satus,  this.note});
}
