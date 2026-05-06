import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final order = orders[index];

        return OrderCard(
          model: order,
          onTap: () async {
            final navContext = Navigator.of(context).context;

            final result = await context.push(
              '/orderdetailsview',
              extra: order,
            );

            if (result == true) {
              navContext.read<OrdersCubit>().refresh();
            }
          },
        );
      }, childCount: orders.length),
    );
  }
}
