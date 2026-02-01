import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_orders_list.dart';

class CustomerStoreOrderViewBody extends StatefulWidget {
  const CustomerStoreOrderViewBody({super.key});

  @override
  State<CustomerStoreOrderViewBody> createState() => _CustomerStoreOrderViewBodyState();
}

class _CustomerStoreOrderViewBodyState extends State<CustomerStoreOrderViewBody> {
String selected = "قيد التحضير";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: FilterOption(
            value: selected,
            items: const ["تم التسليم", "جارِ التوصيل", "قيد التحضير", "ملغي"],
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  selected = val;
                });
              }
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 25)),
       
       
        CustomerOrdersList(selected: selected,),
      ],
    );
  }
}
