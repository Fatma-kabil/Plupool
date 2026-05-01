import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_card_footer.dart';
import 'package:plupool/features/orders/domain/entities/order_item_entity.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/orders/presentation/view/widgets/update_order_card.dart';

class ProductDetailsRow extends StatelessWidget {
  const ProductDetailsRow({super.key, required this.orderr});
  final OrderItemEntity orderr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.h(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // 🔥 البوردر
            child: CachedNetworkImage(
              imageUrl: orderr.image ?? "",
              height: SizeConfig.isWideScreen
                  ? SizeConfig.w(88)
                  : SizeConfig.h(88),
              width: SizeConfig.w(69),
              fit: BoxFit.cover,

              /// 🔄 Loading
              placeholder: (context, url) => Container(
                height: SizeConfig.isWideScreen
                    ? SizeConfig.w(88)
                    : SizeConfig.h(88),
                width: SizeConfig.w(69),
                color: Colors.grey.shade300,
              ),

              /// ❌ Error
              errorWidget: (context, url, error) => Container(
                height: SizeConfig.isWideScreen
                    ? SizeConfig.w(88)
                    : SizeConfig.h(88),
                width: SizeConfig.w(69),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8), // نفس البوردر
                ),
                child: Icon(
                  Icons.inventory_2_outlined, // 🔥 أنسب للأوردر
                  size: SizeConfig.w(18),
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),

          SizedBox(width: SizeConfig.w(10)),

          /// Text section (IMPORTANT)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderr.productName,
                  softWrap: true,
                  style: AppTextStyles.styleSemiBold14(
                    context,
                  ).copyWith(color: const Color(0xff7B7B7B)),
                ),
                SizedBox(height: SizeConfig.h(8)),
                Text(
                  '${orderr.unitPrice} EGP',
                  textDirection: TextDirection.ltr,
                  style: AppTextStyles.styleBold14(
                    context,
                  ).copyWith(color: const Color(0xff333333)),
                ),
              ],
            ),
          ),

          SizedBox(width: SizeConfig.w(8)),

          /// Footer
          OfferCardFooter(
            delonPressed: () => showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => const DeleteOrderCard(),
            ),

            onPressed: () => showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => UpdateOrderCard(),
            ),
          ),
        ],
      ),
    );
  }
}
