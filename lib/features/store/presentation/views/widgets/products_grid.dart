import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/data/models/product_model.dart';
import 'package:plupool/features/store/presentation/views/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;

  const ProductsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: SizeConfig.isWideScreen ? 0.83 : 0.62,
          crossAxisSpacing: SizeConfig.w(12),
          mainAxisSpacing: SizeConfig.w(12),
        ),
        itemBuilder: (_, i) =>
            ProductCard(product: products[i], onPressed: () {}),
      ),
    );
  }
}
