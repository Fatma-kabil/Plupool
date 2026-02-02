import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/rating/presentation/views/widgets/customer_rating_card.dart';

class CustomerRatingViewBody extends StatelessWidget {
  const CustomerRatingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            'تقييمات العميل:',
            style: AppTextStyles.styleBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 18,),),
        SliverList(delegate: SliverChildBuilderDelegate((context, index)
        
         {
         return  CustomerRatingCard();
        },
        childCount: 3
        )
        
        )
      ],
    );

   
  }
}
