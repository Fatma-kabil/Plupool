import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/rating/domain/entities/rating_entity.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final RatingEntity review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.w(20),
        horizontal: SizeConfig.w(10),
      ),
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
            child: Image.network(
              review.userAvatar,
              width: SizeConfig.w(38),
              height: SizeConfig.w(38),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  width: SizeConfig.w(38),
                  height: SizeConfig.w(38),
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.person),
                );
              },
            ),
          ),

          SizedBox(width: SizeConfig.w(7)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name + Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.userName,
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),

                    Text(
                      timeAgo(review.createdAt),
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                ),

                SizedBox(height: SizeConfig.h(3)),

                /// Stars
                Row(
                  children: List.generate(5, (index) {
                    if (review.rating >= index + 1) {
                      /// ⭐ star full
                      return Icon(
                        Icons.star,
                        color: const Color(0xffFF9F1C),
                        size: SizeConfig.isWideScreen
                            ? SizeConfig.w(15)
                            : SizeConfig.w(22),
                      );
                    } else if (review.rating > index &&
                        review.rating < index + 1) {
                      /// 🌗 half star
                      return Icon(
                        Icons.star_half,
                        color: const Color(0xffFF9F1C),
                        size: SizeConfig.isWideScreen
                            ? SizeConfig.w(15)
                            : SizeConfig.w(22),
                      );
                    } else {
                      /// ☆ empty star
                      return Icon(
                        Icons.star_border,
                        color: const Color(0xffFF9F1C),
                        size: SizeConfig.isWideScreen
                            ? SizeConfig.w(15)
                            : SizeConfig.w(22),
                      );
                    }
                  }),
                ),

                SizedBox(height: SizeConfig.w(8)),

                /// Comment
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    review.content,
                    style: AppTextStyles.styleRegular13(
                      context,
                    ).copyWith(color: const Color(0xff555555)),
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
