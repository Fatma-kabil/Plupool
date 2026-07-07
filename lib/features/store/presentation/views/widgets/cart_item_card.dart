import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/domain/entities/cart_entity.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_card_footer.dart';
import 'package:plupool/features/store/presentation/views/widgets/qty_section.dart';

class CartItemCard extends StatelessWidget {
  final CartItemEntity item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(6),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    item.productImageUrl != null &&
                        item.productImageUrl!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: item.productImageUrl ?? "",
                        width: SizeConfig.w(70),
                        height: SizeConfig.h(88),
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) =>
                            const Icon(Icons.broken_image),
                      )
                    : Container(
                        width: SizeConfig.w(70),
                        height: SizeConfig.h(88),
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image_not_supported),
                      ),
              ),

              SizedBox(width: SizeConfig.w(12)),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.styleSemiBold14(
                        context,
                      ).copyWith(color: const Color(0xff7B7B7B)),
                    ),
                    SizedBox(height: SizeConfig.h(5)),
                    Text(
                      "${toArabicNumbers(item.unitPrice.toString())} ج.م",
                      style: AppTextStyles.styleBold14(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                  ],
                ),
              ),

              SizedBox(width: SizeConfig.w(10)),

              QtySection(itemConts: item.quantity),
            ],
          ),
          SizedBox(height: SizeConfig.ismidwidthScreen ? SizeConfig.h(8) : 0),
          Divider(color: AppColors.textFieldBorderColor),
          CartCardFooter(totalItemPrice: item.totalPrice, cartItemId: item.id,),
        ],
      ),
    );
  }
}
