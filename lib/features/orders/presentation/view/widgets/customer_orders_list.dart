import 'package:flutter/material.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_order_card.dart';

class CustomerOrdersList extends StatelessWidget {
  const CustomerOrdersList({super.key, required this.orders});
 
  final List orders;
  @override
  Widget build(BuildContext context) {


   
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CustomerOrderCard(
         order: orders[index],
        onTap: () {
     //       context.push('/customerorderdetailsview', extra: filteredMessages[index]);
          },
        );
      }, childCount: orders.length),
    );
  }
}
