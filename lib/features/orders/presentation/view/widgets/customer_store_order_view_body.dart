import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/orders/domain/entities/order_status_extension.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order state.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_orders_list.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_list_shimer.dart';

class CustomerStoreOrderViewBody extends StatefulWidget {
  const CustomerStoreOrderViewBody({super.key, required this.id});

  final int id;

  @override
  State<CustomerStoreOrderViewBody> createState() =>
      _CustomerStoreOrderViewBodyState();
}

class _CustomerStoreOrderViewBodyState
    extends State<CustomerStoreOrderViewBody> {
  String selected = "قيد الانتظار";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrdersCubit>().getUserOrders(
        userId: widget.id,
        status: orderStatusToApi(selected),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FilterOption(
                value: selected,
                items: const [
                  "قيد الانتظار",
                  "تم التأكيد",
                  "جاري التجهيز",
                  "تم الشحن",
                  "تم التسليم",
                  "ملغي",
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() => selected = val);

                    context.read<OrdersCubit>().getUserOrders(
                      userId: widget.id,
                      status: orderStatusToApi(val),
                    );
                  }
                },
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 25)),

            if (state is OrdersLoading)
              const OrderListShimer()
            else if (state is OrdersError)
              SliverFillRemaining(
                child: Center(child: ErrorText(message: state.message)),
              )
            else if (state is UserOrdersSuccess)
              state.orders.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(child: Text("لا توجد طلبات")),
                    )
                  : CustomerOrdersList(orders: state.orders)
            else
              const SliverToBoxAdapter(child: SizedBox()),
          ],
        );
      },
    );
  }
}
