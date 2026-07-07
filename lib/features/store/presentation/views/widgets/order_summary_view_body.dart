import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/address_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_total_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_total_card_shimmer.dart';
import 'package:plupool/features/store/presentation/views/widgets/payment_method_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class OrderSummaryViewBody extends StatefulWidget {
  const OrderSummaryViewBody({super.key});

  @override
  State<OrderSummaryViewBody> createState() => _OrderSummaryViewBodyState();
}

class _OrderSummaryViewBodyState extends State<OrderSummaryViewBody> {
  @override
void initState() {
  super.initState();

  Future.microtask(() {
    context.read<UserCubit>().fetchCurrentUser("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo");
  });
}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              final cart = cartState.cart;
      
              if (cart == null) {
                return const OrderTotalCardShimmer();
              }
      
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ملخص الطلب",
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
      
                  SizedBox(height: SizeConfig.h(4)),
      
                  TimeDateRow(
                    formattedDate: formatArabicDate(cart.items.first.createdAt),
                  ),
      
                  SizedBox(height: SizeConfig.h(8)),
      
                  OrderTotalCard(cart: cart),
      
                  SizedBox(height: SizeConfig.h(15)),
      
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, userState) {
                      if (userState is UserLoaded) {
                        return AddressCard(user: userState.user);
                      }
      
                      return const SizedBox();
                    },
                  ),
                ],
              );
            },
          ),
      
          SizedBox(height: SizeConfig.h(15)),
      
          const PaymentMethodCard(),
        ],
      ),
    );
  }
}
