import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/presentation/view/widgets/ordr_status_row.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({super.key, required this.model});
  final OrderEntity model;

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
                " طلب رقم #${toArabicNumbers(model.orderNumber)}",
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
            ),
            //    Spacer(),
            OrdrStatusRow(status: model.status),
          ],
        ),
        SizedBox(height: SizeConfig.h(6)),
        Text(
          "${model.userRole} : ${model.userName}",
          textDirection: TextDirection.rtl,
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: SizeConfig.h(6)),
        TimeDateRow(formattedDate: formatArabicDate2(model.createdAt)),
      ],
    );
  }
}
