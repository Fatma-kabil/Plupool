import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/stock_status_helper.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_product_offer_card.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel product;
  final void Function()? onTap;

  const ProductInfo({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // اسم المنتج + زر التعديل
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                product.name,
                textDirection: TextDirection.rtl,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
            ),
            GestureDetector(
              onTap:onTap,
              child: Icon(
                Icons.edit_note_outlined,
                color: AppColors.kprimarycolor,
                size: SizeConfig.w(24),
              ),
            ),
          ],
        ),

        SizedBox(height: SizeConfig.h(5)),

        // السعر الحالي والسعر الأصلي في حالة الخصم
        Row(
          children: [
            Text(
              "${product.finalPrice.toStringAsFixed(0)} ج.م",
              style: AppTextStyles.styleBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            SizedBox(width: SizeConfig.w(10)),
            if (product.hasDiscount)
              Text(
                "${product.originalPrice.toStringAsFixed(0)} ج.م ",
                style: AppTextStyles.styleRegular14(context).copyWith(
                  color: const Color(0xff808080),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),

        SizedBox(height: SizeConfig.h(20)),

        // حالة المخزون
        Row(
          children: [
            Icon(
              Icons.circle,
              size: SizeConfig.w(8),
              color: getStockColor(product.stock),
            ),
            SizedBox(width: SizeConfig.w(4)),
            Text(
              getStockText(product.stock),
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: getStockColor(product.stock)),
            ),

            SizedBox(width: SizeConfig.w(25)),
            Text(
              "المخزون: ${product.stock}",
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false, // لو مش عايزة يتقفل بالضغط برا
                  builder: (context) {
                    return AddProductOfferCard(
                      productName: product.name, // مرري اسم المنتج
                    );
                  },
                );
              },
              child: Icon(
                Icons.local_offer_outlined,
                size: SizeConfig.isWideScreen
                    ? SizeConfig.w(18)
                    : SizeConfig.w(22),
                color: Color(0xffE63946),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
