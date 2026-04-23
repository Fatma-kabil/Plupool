import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/product_offer_cubit/product_offer_cubit.dart';
import 'package:plupool/features/offers/presentation/views/widgets/edit_product_offer_card.dart';
import 'package:plupool/features/offers/presentation/views/widgets/product_offer_view_body.dart';
import 'package:plupool/features/offers/presentation/views/widgets/product_offer_view_card.dart';
import 'package:plupool/features/products/presentation/views/widgets/products_Shimmer_list.dart';

class ProductOfferView extends StatefulWidget {
  const ProductOfferView({super.key});

  @override
  State<ProductOfferView> createState() => _ProductOfferViewState();
}

class _ProductOfferViewState extends State<ProductOfferView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          appBar: CustomAppBar(
            onChanged: (value) {
              print("typing: $value"); // مهم جدًا
              if (value.isEmpty) {
                context.read<ProductOfferCubit>().getOffers(search: null);
                return;
              }
              try {
                BlocProvider.of<ProductOfferCubit>(
                  context,
                ).getOffers(search: value);
                print("CUBIT FOUND ✅");
              } catch (e) {
                print("CUBIT NOT FOUND ❌");
              }
            },
            isSearch: true,
            onPressed: () {
              scaffoldkey.currentState!.openDrawer();
            },
          ),
          drawer: AppDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(13),
              vertical: SizeConfig.h(15),
            ),
            child: BlocBuilder<ProductOfferCubit, ProductOfferState>(
              builder: (context, state) {
                print("STATE: $state");

                return CustomScrollView(
                  slivers: [
                    /// 🔵 Loading
                    if (state is ProductOfferLoading)
                      ProductsShimmerList()
                    /// 🔵 Success
                    else if (state is GetProductOfferSuccess)
                      state.offers.isEmpty
                          ? const SliverFillRemaining(
                              child: ErrorText(message: "مفيش نتائج 😢"),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate((
                                context,
                                index,
                              ) {
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
                              }, childCount: state.offers.length),
                            )
                    /// 🔴 Error
                    else if (state is ProductOfferError)
                      SliverFillRemaining(
                        child: Center(child: ErrorText(message: state.message)),
                      )
                    /// ⚪ Default
                    else
                      const SliverFillRemaining(child: ProductOfferViewBody()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
