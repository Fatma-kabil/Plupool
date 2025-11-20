

import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/product_card.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
              ? 0.62
              : SizeConfig.screenWidth == 800
              ? .73: SizeConfig.screenWidth > 1000?0.80
              : SizeConfig.screenWidth > 800
              ? 0.76 // SizeConfig.screenHeight / SizeConfig.screenWidth * 0.60
              :  0.71,
          crossAxisSpacing: SizeConfig.w(12),
          mainAxisSpacing: SizeConfig.w(12),
        ),
        itemBuilder: (_, i) =>
            ProductCard(product: products[i], ),
      ),
    );
  }
}