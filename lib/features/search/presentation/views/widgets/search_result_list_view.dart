import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/store/presentation/views/widgets/product_card.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(0)),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, i) {
          return ProductCard(product: products[i]);
        }, childCount: products.length),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          childAspectRatio: SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
              ? 0.62
              : SizeConfig.screenWidth == 800
              ? 0.82
              : SizeConfig.screenWidth > 800
              ? 0.91
              : 0.71,

          crossAxisSpacing: SizeConfig.w(12),
          mainAxisSpacing: SizeConfig.w(12),
        ),
      ),
    );
  }
}
