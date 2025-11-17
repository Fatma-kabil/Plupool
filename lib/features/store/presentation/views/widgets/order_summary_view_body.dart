import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:intl/intl.dart' as intl;
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/address_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_total_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/payment_method_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class OrderSummaryViewBody extends StatelessWidget {
  OrderSummaryViewBody({super.key});
  final date = DateTime(2025, 10, 22, 11, 00);
  @override
  Widget build(BuildContext context) {
    final formattedDate = intl.DateFormat(
      'yyyy/MM/dd – hh:mm a',
    ).format(date).replaceAll('AM', 'ص').replaceAll('PM', 'م');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            "ملخص الطلب رقم #12345",
            textDirection: TextDirection.rtl,
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(4)),
          TimeDateRow(formattedDate: formattedDate),
          SizedBox(height: SizeConfig.h(8)),
          OrderTotalCard(),
          SizedBox(height: SizeConfig.h(15)),
          AddressCard(),
          SizedBox(height: SizeConfig.h(15)),
          PaymentMethodCard(),
         
        ],
      ),
    );
  }
}
