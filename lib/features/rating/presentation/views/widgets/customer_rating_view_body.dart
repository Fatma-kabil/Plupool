import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/customers/domain/entities/user_rating_entity.dart';
import 'package:plupool/features/rating/presentation/views/widgets/customer_rating_card.dart';

class CustomerRatingViewBody extends StatelessWidget {
  const CustomerRatingViewBody({super.key, required this.userRating});
  final List<UserRatingEntity> userRating;

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            'التقييمات :',
            style: AppTextStyles.styleBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 18)),

        /// ✅ لا يوجد تقييمات
        if (userRating.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: ErrorText(message: "لا توجد تقييمات بعد ⭐")),
          )
        /// ✅ يوجد تقييمات
        else
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CustomerRatingCard(userRating: userRating[index]);
            }, childCount: userRating.length),
          ),
      ],
    );
  }
}
