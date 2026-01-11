
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/data/models/customer_service_card_model.dart';

class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
    required this.request,
  });

  final CustomerServiceCardModel request;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          size: SizeConfig.w(12),
          color: Color(0xff777777),
        ),
        SizedBox(width: SizeConfig.w(2),),
        Text(
          DateFormat('EEEE d/M/yyyy', 'ar').format(request.date),
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
