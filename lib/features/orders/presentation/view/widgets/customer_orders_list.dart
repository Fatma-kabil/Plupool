import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/orders/domain/entities/order_status_extension.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_order_card.dart';

class CustomerOrdersList extends StatelessWidget {
  const CustomerOrdersList({
    super.key,
    required this.orders,
    required this.userId,
    required this.selected,
  });
  final int userId;
  final String selected;
  final List orders;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CustomerOrderCard(
          order: orders[index],
          onTap: () async {
            final cubit = context.read<OrdersCubit>();

            final result = await context.push(
              '/customerorderdetailsview',
              extra: orders[index]['id'],
            );

            if (result == true) {
              await cubit.getUserOrders(
                userId: userId,
                status: orderStatusToApi(selected),
              );
            }
          },
        );
      }, childCount: orders.length),
    );
  }
}
