import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// لو مش محتاجة ممكن تشيليها
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/parse_hex_color_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/add_cart_btn.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  double finalPrice(Product product) {
    if (product.discountValue == null || product.discountValue == 0) {
      return product.price.toDouble();
    }
    return product.price - (product.price * (product.discountValue! / 100));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(10),
              vertical: SizeConfig.h(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: product.imageUrl ?? "",
                        height: SizeConfig.isWideScreen
                            ? SizeConfig.w(101)
                            : SizeConfig.h(101),
                        width: SizeConfig.w(151),
                        fit: BoxFit.fill,

                        placeholder: (context, url) => Container(
                          height: SizeConfig.isWideScreen
                              ? SizeConfig.w(101)
                              : SizeConfig.h(101),
                          width: SizeConfig.w(151),
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),

                        errorWidget: (context, url, error) => Container(
                          height: SizeConfig.isWideScreen
                              ? SizeConfig.w(101)
                              : SizeConfig.h(101),
                          width: SizeConfig.w(151),
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.broken_image),
                        ),
                      ),
                      if (product.badges != null && product.badges!.isNotEmpty)
                        Positioned(
                          top: SizeConfig.h(8),
                          left: SizeConfig.w(8),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.w(9),
                              vertical: SizeConfig.h(6),
                            ),
                            decoration: BoxDecoration(
                              color: parseHexColor(product.badges!.first.color),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              product.badges!.first.label,
                              style: AppTextStyles.styleBold10(
                                context,
                              ).copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.h(12)),
                Text(
                  product.name,
                  textDirection: TextDirection.rtl,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.styleSemiBold14(
                    context,
                  ).copyWith(color: const Color(0xff7B7B7B)),
                ),
                SizedBox(height: SizeConfig.h(5)),
                Row(
                  children: [
                    Text(
                      product.hasActiveOffer == true
                          ? "${toArabicNumbers(finalPrice(product).toString())} ج.م"
                          : "${toArabicNumbers(product.price.toString())} ج.م",
                      style: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                    SizedBox(width: SizeConfig.w(10)),
                    if (product.hasActiveOffer == true)
                      Text(
                        "${toArabicNumbers(product.price.toString())} ج.م",
                        style: AppTextStyles.styleRegular14(context).copyWith(
                          color: const Color(0xff808080),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    SizedBox(width: SizeConfig.w(6)),
                  ],
                ),
                const Spacer(),
                AddCartBtn(
                  onPressed: () {
                    if (authState.status == AuthStatus.guest) {
                      // عرض رسالة الخطأ بدون بلور
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ErrorCard(
                            title: 'لم يتم تسجيل الدخول',
                            subtitle:
                                'لتستمتع بتجربتك وتتابع خدماتك، قم بتسجيل الدخول أولاً.',
                            color: Colors.white,
                          );
                        },
                      );
                    } else {
                      // الكود الخاص بإضافة المنتج للسلة
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
