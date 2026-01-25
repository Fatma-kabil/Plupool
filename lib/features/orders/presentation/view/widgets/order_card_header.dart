
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/orders/presentation/view/widgets/ordr_status_row.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';
import 'package:intl/intl.dart' as intl;

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({super.key, required this.model});
final OrderCardModel model;

  @override
  Widget build(BuildContext context) {
     final formattedDate = intl.DateFormat(
      'yyyy/MM/dd – hh:mm a',
    ).format(model.date).replaceAll('AM', 'ص').replaceAll('PM', 'م');
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " طلب رقم #12345",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            SizedBox(height: SizeConfig.h(6)),
             Text(
              "عميل : أحمد محمد",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            SizedBox(height: SizeConfig.h(6)),
            TimeDateRow(formattedDate: formattedDate),
          ],
        ),
        Spacer(),
       OrdrStatusRow(status: model.satus)

      ],
    );
  }
}

