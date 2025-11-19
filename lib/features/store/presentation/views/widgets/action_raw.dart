import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/rounded_shadow_container.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_badge.dart';

class ActionsRow extends StatelessWidget {
  final int cartCount;

  const ActionsRow({
    super.key,
    required this.cartCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // 🛒 سلة المشتريات
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
                right:SizeConfig.w(14) ,
                top:SizeConfig.h( -9),
                child: CartBadge(count: cartCount), // البادج هنا
              ),
            ],
          ),
        ),
         SizedBox(width:SizeConfig.w(7) ),

        // 🔍 البحث
        RoundedShadowContainer(
          ontap: () => context.push('/searchview'),
          child: Icon(
            Icons.search,
            color: AppColors.kprimarycolor,
            size: SizeConfig.w(20),
          ),
        ),
      ],
    );
  }
}
