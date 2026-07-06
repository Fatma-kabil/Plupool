import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/cart_cubit.dart/cart_state.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_badge.dart';
import 'package:plupool/features/store/presentation/views/widgets/rounded_shadow_container.dart';

class ActionsRow extends StatelessWidget {
  const ActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RoundedShadowContainer(
              ontap: () => context.push('/searchview'),
              child: Icon(
                Icons.search,
                color: AppColors.kprimarycolor,
                size: SizeConfig.w(20),
              ),
            ),

            SizedBox(width: SizeConfig.w(7)),

            RoundedShadowContainer(
              ontap: () => context.push('/cartview'),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: SizeConfig.w(20),
                    color: AppColors.kprimarycolor,
                  ),

                  Positioned(
                    right: SizeConfig.w(14),
                    top: -SizeConfig.h(9),
                    child: CartBadge(
                      count: state.cartCount,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}