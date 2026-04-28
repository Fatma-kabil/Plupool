import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerRatingStars extends StatelessWidget {
  const CustomerRatingStars({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'التقييم',
          style: AppTextStyles.styleRegular16(context),
        ),

        const Spacer(),

        Row(
          children: List.generate(5, (index) {
            if (rating >= index + 1) {
              /// ⭐ star full
              return Icon(
                Icons.star,
                color: const Color(0xffFF9F1C),
                size: SizeConfig.isWideScreen
                    ? SizeConfig.w(15)
                    : SizeConfig.w(22),
              );
            } else if (rating > index && rating < index + 1) {
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
      ],
    );
  }
}