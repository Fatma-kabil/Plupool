import 'package:flutter/material.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_datails_view_header.dart';

class OrderDatailsViewBody extends StatelessWidget {
  const OrderDatailsViewBody({super.key, required this.model});
  final OrderCardModel model;
  @override
  Widget build(BuildContext context) {
 return   SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageDatailsViewHeader(),
          SizedBox(height: 25),
         
          SizedBox(height: 25),
         
        ],
      ),
    );
  }
}
