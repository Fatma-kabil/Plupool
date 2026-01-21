import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/products/presentation/views/widgets/product_image_with_bage.dart';
import 'package:plupool/features/products/presentation/views/widgets/product_info.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

class ProCard extends StatelessWidget {
  const ProCard({super.key, required this.product,});
  final ProductModel product;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.h(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(6),
          vertical: SizeConfig.h(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           ProductImageWithBadge(product: product),
            SizedBox(width: SizeConfig.w(8)),
            Expanded(child: ProductInfo(product: product)),
          ],
        ),
      ),
    );
  }
}
