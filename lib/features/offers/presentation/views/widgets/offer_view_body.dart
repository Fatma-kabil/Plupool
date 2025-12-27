import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_card.dart';

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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: offers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                child: OfferCard(offer: offers[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
