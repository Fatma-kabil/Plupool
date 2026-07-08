import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/address_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_total_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_total_card_shimmer.dart';
import 'package:plupool/features/store/presentation/views/widgets/payment_method_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class OrderSummaryViewBody extends StatelessWidget {
  const OrderSummaryViewBody({
    super.key,
    required this.user,
    required this.addressController,
    required this.phoneController,
    required this.selectedCountryCode,
    required this.onCountryChanged,
  });

  final UserEntity user;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final String selectedCountryCode;
  final ValueChanged<String> onCountryChanged;

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
                    formattedDate: formatArabicDate2(
                   DateTime.now()
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(8)),

                  OrderTotalCard(cart: cart),

                  SizedBox(height: SizeConfig.h(15)),

                  AddressCard(
                    user: user,
                    addressController: addressController,
                    phoneController: phoneController,
                    selectedCountryCode: selectedCountryCode,
                    onCountryChanged: onCountryChanged,
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