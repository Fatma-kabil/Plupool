import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/product_filter_helper.dart';
import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/features/offers/presentation/views/widgets/edit_product_offer_card.dart';
import 'package:plupool/features/products/presentation/views/widgets/pro_card.dart';


class ProductOfferViewBody extends StatelessWidget {
  const ProductOfferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
   
  final discountedProducts = ProductFilterHelper.applyFilter(products, StoreFilter.discount, );

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: Text(
            'إدارة العروض',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 12)),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ProCard(
              product: discountedProducts[index],
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      EditProductOfferCard(product: discountedProducts[index]),
                );
              },
            );
          }, childCount: discountedProducts.length),
        ),
      ],
    );
  }
}
