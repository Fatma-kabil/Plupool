
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/owner_offer_section_shimmer.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_offer_carousel.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/product_offer_cubit/product_offer_cubit.dart';

class OfferSection extends StatefulWidget {
  const OfferSection({super.key});

  @override
  State<OfferSection> createState() => _OfferSectionState();
}

class _OfferSectionState extends State<OfferSection> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductOfferCubit>().getOffers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductOfferCubit, ProductOfferState>(
      builder: (context, state) {
        // =========================
        // Loading
        // =========================
        if (state is ProductOfferLoading) {
          return const OwnerOfferSectionShimmer();
        }

        // =========================
        // Success
        // =========================
        if (state is GetProductOfferSuccess) {
          // نجيب الـ Featured Offers فقط
          final upOffers = state.offers
              .where((offer) => offer.isFeatured == true)
              .toList();

          // لو مفيش Featured Offers
          // السيكشن كله مش هيظهر
          if (upOffers.isEmpty) {
            return const SizedBox.shrink();
          }

          return Column(
            children: [
              // =========================
              // Header
              // =========================
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'عروضنا الخاصة',
                    style: AppTextStyles.styleBold20(
                      context,
                    ).copyWith(
                      color: AppColors.ktextcolor,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      context
                          .read<BottomNavCubit>()
                          .changeCurrentIndex(
                            2,
                            filter: StoreFilter.offers,
                          );
                    },
                    child: Text(
                      'عرض الكل',
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(
                        color: AppColors.kprimarycolor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(16)),

              // =========================
              // Offers Carousel
              // =========================
              TechOffersCarousel(
                offers: upOffers,
              ),

              const SizedBox(height: 30),
            ],
          );
        }

        // =========================
        // Error
        // =========================
        if (state is ProductOfferError) {
          return ErrorText(
            message: state.message,
          );
        }

        // =========================
        // Default
        // =========================
        return const SizedBox.shrink();
      },
    );
  }
}
