import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/review_card_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});
  final ReviewCardModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical:SizeConfig.h(6) ),
      padding:  EdgeInsets.symmetric(vertical:SizeConfig.w(20) , horizontal:SizeConfig.w(10) ),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              review.avatarUrl,
              width: SizeConfig.w(38),
              height: SizeConfig.w(38),
              fit: BoxFit.cover,
            ),
          ),

           SizedBox(width:SizeConfig.w(7) ),

          /// Name + Stars + Comment
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name + Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.name,
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                    Text(
                      review.timeAgo,
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                    ),
                  ],
                ),

                 SizedBox(height:SizeConfig.h(3) ),

                /// Stars
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < review.rating ? Icons.star : Icons.star_border,
                      color: Color(0xffFF9F1C),
                      size: SizeConfig.w(18),
                    ),
                  ),
                ),

                 SizedBox(height:SizeConfig.w(8) ),

                /// Comment
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    review.comment,

                    style: AppTextStyles.styleRegular13(
                      context,
                    ).copyWith(color: Color(0xff555555)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
