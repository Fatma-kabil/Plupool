import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/stock_status_helper.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/product_offer_cubit/product_offer_cubit.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';

import 'package:plupool/features/products/domain/entities/product_entity.dart';

class ProductOfferViewCardInfo extends StatelessWidget {
  final Product product;
  final void Function()? onTap;

  const ProductOfferViewCardInfo({
    super.key,
    required this.product,
    this.onTap,
  });

  double finalPrice(Product product) {
    if (product.discountValue == null || product.discountValue == 0) {
      return product.price.toDouble();
    }
    return product.price - (product.price * (product.discountValue! / 100));
  }

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
              onTap: onTap,
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
            // السعر الأساسي (لو فيه عرض يبقى بعد الخصم)
            Text(
              product.hasOffer == true
                  ? "${toArabicNumbers(finalPrice(product).toString())} ج.م"
                  : "${toArabicNumbers(product.price.toString())} ج.م",
              style: AppTextStyles.styleBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),

            SizedBox(width: SizeConfig.w(10)),

            // السعر القديم يظهر بس لو فيه عرض
            if (product.hasOffer == true)
              Text(
                "${toArabicNumbers(product.price.toString())} ج.م",
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
              "المخزون: ${toArabicNumbers(product.stock.toString())}",
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    final cubit = context.read<ProductOfferCubit>();
                    return BlocConsumer<ProductOfferCubit, ProductOfferState>(
                      listener: (context, state) {
                        if (state is ProductOfferSuccess) {
                          context.read<ProductOfferCubit>().getOffers();
                          Navigator.pop(context);
                          showCustomSnackBar(
                            context: context,
                            message: "تم حذف العرض بنجاح 🗑️",
                            isSuccess: true,
                          );
                        }

                        if (state is DeleteProductOfferError) {
                          context.read<ProductOfferCubit>().getOffers();
                          Navigator.pop(context);

                          showCustomSnackBar(
                            context: context,
                            message: state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is ProductOfferLoading;

                        return DeleteOrderCard(
                          text: "هل أنت متأكد من حذف هذا العرض؟",
                          isLoading: isLoading,
                          onPressed: isLoading
                              ? null
                              : () {
                                  cubit.deleteOffer(product.id!);
                                },
                        );
                      },
                    );
                  },
                );
              },

              child: Icon(
                Icons.delete_outline,
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
