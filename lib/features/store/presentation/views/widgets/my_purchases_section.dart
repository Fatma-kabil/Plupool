import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/cubits/store_orders_cubit/store_orders_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/store_orders_cubit/store_orders_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/empty_card_section.dart';
import 'package:plupool/features/store/presentation/views/widgets/my_purchases_card.dart';

class MyPurchasesSection extends StatelessWidget {
  const MyPurchasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreOrdersCubit, StoreOrdersState>(
      builder: (context, state) {
        if (state.status == StoreOrdersStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.status == StoreOrdersStatus.failure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }

        if (state.orders.isEmpty) {
          return const EmptyCartSection(
            icon: Icons.shopping_bag_outlined,
            tittle: "لا توجد مشتريات بعد",
          );
        }

        return Column(
          children: [
            SizedBox(
              height:
                  SizeConfig.ismidwidthScreen ? SizeConfig.h(8) : 0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  return MyPurchasesCard(
                    order: state.orders[index],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}