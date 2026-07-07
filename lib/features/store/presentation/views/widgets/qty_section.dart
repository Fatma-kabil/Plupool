import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:plupool/features/store/presentation/views/widgets/Qty_Btn.dart';

class QtySection extends StatelessWidget {
  const QtySection({super.key, required this.itemConts, required this.itemId});
  final int itemConts;
  final int itemId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QtyBtn(
          icon: Icons.add,
          backgroundcolor: AppColors.kprimarycolor,
          onTap: () {
            context.read<CartCubit>().updateCartItem(
              cartItemId: itemId,
              quantity: itemConts + 1,
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
          child: Text(
            toArabicNumbers(itemConts.toString()),
            style: AppTextStyles.styleRegular18(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),
        QtyBtn(
          icon: Icons.remove,
          backgroundcolor: Color(0xffCDCDCD),
          onTap: () {
            if (itemConts > 1) {
              context.read<CartCubit>().updateCartItem(
                cartItemId: itemId,
                quantity: itemConts - 1,
              );
            } else {
              context.read<CartCubit>().deleteCartItem(cartItemId: itemId);
            }
          },
        ),
      ],
    );
  }
}
