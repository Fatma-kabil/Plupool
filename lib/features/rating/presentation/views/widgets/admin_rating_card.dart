import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/rating/presentation/views/widgets/customer_commet_section.dart';
import 'package:plupool/features/rating/presentation/views/widgets/customer_rating_stars.dart';
import 'package:plupool/features/rating/presentation/views/widgets/rating_card_header.dart';

class AdminRatingCard extends StatelessWidget {
  const AdminRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.h(8.0)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12.0),
        vertical: SizeConfig.h(16.0),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingCardHeader(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(8.0),
              horizontal: SizeConfig.w(4.0),
            ),
            child: Divider(),
          ),
         CustomerRatingStars(),
          SizedBox(height: SizeConfig.h(8.0)),
         CustomerCommentSection()
        ],
      ),
    );
  }
}
