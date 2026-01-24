import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/rating/presentation/views/widgets/admin_rating_card.dart';

class AdminRatingViewBody extends StatelessWidget {
  const AdminRatingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            'ابحث عن العميل:',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(4),
              vertical: SizeConfig.h(15),
            ),
            child:  CustomSearchPerson(
              hintText: "ابحث باسم ممثل الشركه او رقم الهاتف",
            ),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return AdminRatingCard();
          },
          childCount: 10, // Number of list items
        )),
        // Additional slivers can be added here
      ],
    );
  }
}
