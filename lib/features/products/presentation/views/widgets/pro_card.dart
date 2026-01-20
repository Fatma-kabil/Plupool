import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/get_badge_color.dart';
import 'package:plupool/core/utils/functions/get_badge_text.dart';
import 'package:plupool/core/utils/functions/stock_status_helper.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

class ProCard extends StatelessWidget {
  const ProCard({super.key, required this.product,});
  final ProductModel product;
  

  @override
  Widget build(BuildContext context) {
    final badgeText = getBadgeText(product);
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.asset(
                    product.image,
                    height: SizeConfig.isWideScreen
                        ? SizeConfig.w(100)
                        : SizeConfig.h(114),
                    width: SizeConfig.w(95),
                    fit: BoxFit.cover,
                  ),
                  if (badgeText != null)
                    Positioned(
                      top: SizeConfig.h(8),
                      right: SizeConfig.w(8),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.w(9),
                          vertical: SizeConfig.h(6),
                        ),
                        decoration: BoxDecoration(
                          color: getBadgeColor(product.badge),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          badgeText,
                          style: AppTextStyles.styleBold10(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: SizeConfig.w(8)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          product.name,
                          textDirection: TextDirection.rtl,
                          softWrap: true, // يسمح بالنزول لسطر جديد
                          overflow: TextOverflow.visible,
                          style: AppTextStyles.styleSemiBold16(
                            context,
                          ).copyWith(color: AppColors.ktextcolor),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          context.push('/editproductview',extra: product);
                        },
                        child: Icon(
                            Icons.edit_note_outlined,
                            color: AppColors.kprimarycolor,
                            size: SizeConfig.w(24),
                          ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height: SizeConfig.h(5)),
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
                  //    Spacer(),
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
