import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_card.dart';

class OurProjectSection extends StatelessWidget {
  const OurProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// عنوان + زر الإضافة
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "المشاريع",
                style: AppTextStyles.styleBold16(context)
                    .copyWith(color: AppColors.ktextcolor),
              ),
              AddOfferBtn(
                text: "إضافة مشروع جديد",
                onTap: () {
                  // context.push('/addofferview');
                },
              ),
            ],
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(20))),

        /// قائمة المشاريع
        offers.isEmpty
            ? SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.h(20)),
                  child: Center(
                    child: Text(
                      "لا توجد مشاريع",
                      style: AppTextStyles.styleRegular14(context),
                    ),
                  ),
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                      child: OfferCard(offer: offers[index]),
                    );
                  },
                  childCount: offers.length,
                ),
              ),
      ],
    );
  }
}
