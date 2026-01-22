import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerRatingStars extends StatelessWidget {
  const CustomerRatingStars({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'تقييم العميل',
          style: AppTextStyles.styleRegular16(context),
        ),
        const Spacer(),
        Row(
          children: List.generate(
            5,
            (_) => Icon(
              Icons.star,
              color: Color(0xffFF9F1C),
              size: SizeConfig.w(18),
            ),
          ),
        ),
      ],
    );
  }
}