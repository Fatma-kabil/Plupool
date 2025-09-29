import 'package:flutter/material.dart';
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.60,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (_, i) =>
            ProductCard(product: products[i], onPressed: () {}),
      ),
    );
  }
}
