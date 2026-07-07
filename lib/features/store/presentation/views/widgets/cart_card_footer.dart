import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
class CartCardFooter extends StatelessWidget {
  const CartCardFooter({
    super.key,
    required this.totalItemPrice,
    required this.cartItemId,
  });

  final double totalItemPrice;
  final int cartItemId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "الإجمالي :",
          style: AppTextStyles.styleMedium14(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),

        Text(
          toArabicNumbers("$totalItemPrice ج.م"),
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),

        const Spacer(),

        Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton(
            onPressed: () {
              context.read<CartCubit>().deleteCartItem(
                    cartItemId: cartItemId,
                  );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete,
                  size: SizeConfig.w(18),
                  color: const Color(0xffEA5A65),
                ),
                SizedBox(width: SizeConfig.w(2)),
                Text(
                  "حذف",
                  style: AppTextStyles.styleBold14(
                    context,
                  ).copyWith(
                    color: const Color(0xffEA5A65),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}