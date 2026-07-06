import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';

import 'package:plupool/features/orders/domain/entities/order_status.dart';
import 'package:plupool/features/orders/domain/entities/order_status_extension.dart';

class TotalAndStatus extends StatelessWidget {
  const TotalAndStatus({super.key, required this.total, required this.status});
  final double total;
  final String status;
  @override
  Widget build(BuildContext context) {
    final OrderStatus orderStatus = parseOrderStatus(status);
    return Row(
      children: [
        Text(
          orderStatus.arName,
          textDirection: TextDirection.rtl,
          style: AppTextStyles.styleBold14(
            context,
          ).copyWith(color: orderStatus.color),
        ),
        SizedBox(width: SizeConfig.w(4)),
        Icon(
          orderStatus.icon,
          color: orderStatus.color,
          size: SizeConfig.w(20),
        ),
        Spacer(),
        Text(
          "الإجمالي :",
          textDirection: TextDirection.rtl,
          style: AppTextStyles.styleMedium14(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        Text(
          toArabicNumbers("${total.toStringAsFixed(0)} ج.م"),
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
      ],
    );
  }
}
