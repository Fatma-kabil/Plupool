import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/owner_offer_carusal.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/owner_offer_section_shimmer.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_cubit.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_state.dart';

class OwnerOfferCarusalBloc extends StatefulWidget {
  const OwnerOfferCarusalBloc({super.key});

  @override
  State<OwnerOfferCarusalBloc> createState() => _OwnerOfferCarusalBlocState();
}

class _OwnerOfferCarusalBlocState extends State<OwnerOfferCarusalBloc> {
  @override
  void initState() {
    super.initState();
    context.read<OfferCubit>().fetchOffers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferCubit, OfferState>(
      builder: (context, state) {
        if (state is OfferLoading) {
          return OwnerOfferSectionShimmer();
        }

        if (state is OfferLoaded) {
          final upOffers = state.offers
              .where((offer) => offer.isFeatured == true)
              .toList();

          return Column(
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'عروضنا الخاصة',
                    style: AppTextStyles.styleBold20(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.push('/offerdetailsview', extra: state.offers);
                    },
                    child: Text(
                      ' عرض الكل',
                      style: AppTextStyles.styleSemiBold16(context).copyWith(
                        color: AppColors.kprimarycolor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.h(16)),
              OwnerOfferCarusal(offers: upOffers),
               const SizedBox(height: 27),
            ],
          );
        }

        if (state is OfferError) {
          return ErrorText(message:  state.message);
        }

        return const SizedBox();
      },
    );
  }
}
