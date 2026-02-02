import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/rating/presentation/views/widgets/delete_rating_btn.dart';

//import 'package:intl/intl.dart';

class CustomerRatingCard extends StatelessWidget {
  CustomerRatingCard({super.key});

  final date = DateTime(2025, 8, 5);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تقييم العميل',
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Colors.black),
              ),
              Text(
                formatDate(date),
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(12)),
          Row(
            children: List.generate(
              5,
              (_) => Icon(
                Icons.star,
                color: Color(0xffFF9F1C),
                size: SizeConfig.isWideScreen
                    ? SizeConfig.w(15)
                    : SizeConfig.w(22),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.h(12)),
          Row(
            children: [
              Icon(
                Icons.comment_outlined,
                size: SizeConfig.w(SizeConfig.isWideScreen ? 15 : 20),
                color: Color(0xffBBBBBB),
              ),
              SizedBox(width: SizeConfig.w(8)),
              Expanded(
                child: Text(
                  'الفني فيصل عمل جيد بشكل عام لكنه تأخر حوالي 20 دقيقة عن الموعد دون إشعار مسبق. العمل نفسه كان نظيفاً واحترافياً.',
                  style: AppTextStyles.styleRegular14(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [DeleteRatingBtn()],
          ),
        ],
      ),
    );
  }
}
