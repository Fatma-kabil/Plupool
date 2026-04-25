import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/rating/presentation/views/widgets/delete_rating_btn.dart';

import 'package:plupool/features/rating/domain/entities/rating_entity.dart';
import 'package:plupool/features/rating/presentation/views/widgets/pending_row.dart';
import 'package:plupool/features/rating/presentation/views/widgets/reject_row.dart';
class RatingCardHeader extends StatelessWidget {
  const RatingCardHeader({super.key,required this.rating});
  final RatingEntity rating;

  @override
  Widget build(BuildContext context) {
    return  Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'العميل: ${rating.userName}',
                  style: AppTextStyles.styleMedium16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                SizedBox(height: SizeConfig.h(8.0)),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calendar_month_outlined,size: SizeConfig.w(12),color: Color(0xff777777),),
                     SizedBox(width: SizeConfig.w(6.0)),
                    Text(
                      textDirection: TextDirection.rtl,
                     formatMonthDate(rating. createdAt),
                      style: AppTextStyles.styleRegular14(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                    SizedBox(width: SizeConfig.w(16.0)),
                    Text(
                      textDirection: TextDirection.rtl,
                     formatTimeArabic2(rating. createdAt),
                      style: AppTextStyles.styleRegular14(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            if(rating.status == 'pending')
              PendingRow(id: rating.id,)
            else if(rating.status == 'approved')
              DeleteRatingBtn(id: rating.id,)
            else if(rating.status == 'rejected')
              RejectRow(id: rating.id,)
          
          ],
        );
  }
}

  
