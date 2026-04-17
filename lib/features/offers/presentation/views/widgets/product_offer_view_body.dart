import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/product_offer_cubit/product_offer_cubit.dart';
import 'package:plupool/features/offers/presentation/views/widgets/edit_product_offer_card.dart';
import 'package:plupool/features/offers/presentation/views/widgets/product_offer_view_card.dart';
import 'package:plupool/features/products/presentation/views/widgets/products_Shimmer_list.dart';
class ProductOfferViewBody extends StatefulWidget {
  const ProductOfferViewBody({super.key});

  @override
  State<ProductOfferViewBody> createState() => _ProductOfferViewBodyState();
}

class _ProductOfferViewBodyState extends State<ProductOfferViewBody> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ProductOfferCubit>().getOffers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductOfferCubit, ProductOfferState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            SliverToBoxAdapter(
              child: Text(
                'إدارة العروض:',
                style: AppTextStyles.styleSemiBold16(context)
                    .copyWith(color: AppColors.ktextcolor),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            // ================= LOADING =================
            if (state is ProductOfferLoading)
              ProductsShimmerList(),

            // ================= ERROR =================
            if (state is ProductOfferError)
              SliverToBoxAdapter(
                child: ErrorText(message: state.message),
              ),

            // ================= SUCCESS =================
            if (state is GetProductOfferSuccess) ...[
              if (state.offers.isEmpty)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "لا توجد عروض متاحة حالياً 🛒📭",
                        style: AppTextStyles.styleMedium16(context)
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final offer = state.offers[index];

                      return ProductOfferViewCard(
                        product: offer,
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) =>
                                EditProductOfferCard(product: offer),
                          );
                        },
                      );
                    },
                    childCount: state.offers.length,
                  ),
                ),
            ],
          ],
        );
      },
    );
  }
}