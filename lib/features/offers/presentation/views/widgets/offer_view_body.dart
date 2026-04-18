import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_cubit.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_state.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_card.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_shimmer_card.dart';

class OfferViewBody extends StatelessWidget {
  const OfferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "إدارة العروض",
                style: AppTextStyles.styleSemiBold16(context),
              ),
              AddOfferBtn(
                text: "إضافة عرض",
                onTap: () {
                  context.push('/addofferview');
                },
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(20)),
          BlocBuilder<OfferCubit, OfferState>(
            builder: (context, state) {
              if (state is OfferLoading) {
                return const Center(child: OfferShimmerCard());
              }

              if (state is OfferError) {
                return  ErrorText(message: state.message);
              }

              if (state is OfferLoaded) {
                if (state.offers.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "لا توجد عروض متاحة حالياً 🛒📭",
                        style: AppTextStyles.styleMedium16(context)
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.offers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                        child: OfferCard(offer: state.offers[index]),
                      );
                    },
                  );
                }
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
