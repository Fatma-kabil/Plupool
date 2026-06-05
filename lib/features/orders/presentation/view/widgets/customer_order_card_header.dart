import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';

import 'package:plupool/features/orders/presentation/view/widgets/ordr_status_row.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class CustomerOrderCardHeader extends StatelessWidget {
  const CustomerOrderCardHeader({super.key,  required this.orderNumber, required this.status, required this.createdAt});
  
  final String orderNumber;
  final String status;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                " طلب رقم #${toArabicNumbers(orderNumber)}",
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
            ),
            //    Spacer(),
            OrdrStatusRow(status: status),
          ],
        ),

        SizedBox(height: SizeConfig.h(6)),
        TimeDateRow(formattedDate: formatArabicDate2(createdAt),),
      ],
    );
  }
}
