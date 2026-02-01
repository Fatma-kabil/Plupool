import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/orders/domain/entities/order_status.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_order_card.dart';

class CustomerOrdersList extends StatelessWidget {
  const CustomerOrdersList({super.key, required this.selected});
 final String selected;
  @override
  Widget build(BuildContext context) {
    final filteredMessages = orderCards.where((order) {
      if (selected == "ملغي") {
        return order.satus == OrderStatus.cancelled;
      } else if (selected == "تم التسليم") {
        return order.satus == OrderStatus.delivered;
      } else if (selected == "جارِ التوصيل") {
        return order.satus == OrderStatus.onTheWay;
      } else {
        return order.satus == OrderStatus.preparing;
      }
    }).toList();

    if (filteredMessages.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            'لا توجد طلبات',
            style: AppTextStyles.styleSemiBold25(context),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CustomerOrderCard(
          model: filteredMessages[index],
          onTap: () {
            context.push('/customerorderdetailsview', extra: filteredMessages[index]);
          },
        );
      }, childCount: filteredMessages.length),
    );
  }
}
