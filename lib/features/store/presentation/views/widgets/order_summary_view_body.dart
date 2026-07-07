import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/address_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_total_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_total_card_shimmer.dart';
import 'package:plupool/features/store/presentation/views/widgets/payment_method_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class OrderSummaryViewBody extends StatelessWidget {
  const OrderSummaryViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cart = state.cart;

            if (cart == null) {
              return OrderTotalCardShimmer();
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
              ],
            );
          },
        ),
        SizedBox(height: SizeConfig.h(15)),
        AddressCard(),
        SizedBox(height: SizeConfig.h(15)),
        PaymentMethodCard(),
      ],
    );
  }
}
