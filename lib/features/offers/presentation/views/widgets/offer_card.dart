import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_cubit.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_state.dart';
import 'package:plupool/features/offers/presentation/views/widgets/date_row.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_card_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_image_card.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.offer});
  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Row(
        children: [
          OfferImageCard(offer: offer),
          SizedBox(width: SizeConfig.w(12)),
          Expanded(
            child: SizedBox(
              height: SizeConfig.isWideScreen
                  ? SizeConfig.w(125)
                  : SizeConfig.h(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الجزء العلوي
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                      SizedBox(height: SizeConfig.h(5)),
                      DateRow(offer: offer),
                      SizedBox(height: SizeConfig.h(5)),
                      Text(
                        offer.description,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleRegular14(
                          context,
                        ).copyWith(color: Color(0xff777777)),
                      ),
                    ],
                  ),

                  OfferCardFooter(
                    onPressed: () {
                      context.push('/editofferview', extra: offer);
                    },
                    delonPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (dialogContext) {
                          final cubit = context.read<OfferCubit>();

                          return BlocConsumer<OfferCubit, OfferState>(
                            bloc: cubit,

                            listener: (context, state) {
                              if (state is OfferSuccess) {
                                Navigator.pop(dialogContext);

                                showCustomSnackBar(
                                  context: context,
                                  message: "تم حذف العرض بنجاح 🗑️",
                                  isSuccess: true,
                                );
                              }

                              if (state is DeleteOfferError) {
                                Navigator.pop(dialogContext);

                                showCustomSnackBar(
                                  context: context,
                                  message: state.message,
                                );
                              }
                            },

                            builder: (context, state) {
                              final isLoading = state is OfferLoading;

                              return DeleteOrderCard(
                                text: "هل أنت متأكد من حذف هذا العرض؟",
                                isLoading: isLoading,
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        cubit.deleteOffer(offer.id!);
                                      },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
