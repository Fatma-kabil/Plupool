import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/products/presentation/views/widgets/pro_card.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products});
   final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverList(

      delegate: SliverChildBuilderDelegate((context, index) {
        return ProCard(product: products[index],
        onTap: () {
                context.push('/editproductview', extra: products[index]);
              },
        );
      
      },
      childCount: products.length),
    );
  }
}
