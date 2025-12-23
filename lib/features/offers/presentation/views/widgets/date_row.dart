import 'package:flutter/material.dart';

import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:intl/intl.dart';

class DateRow extends StatelessWidget {
  const DateRow({super.key, required this.offer});

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month_outlined,
          size: SizeConfig.w(12),
          color: Color(0xff525252),
        ),
        SizedBox(width: SizeConfig.w(4)),
        Text('العرض ساري حتي ', style: AppTextStyles.styleRegular11(context)),
        Text(
          DateFormat('dd/MM/yyyy').format(offer.endDate!),
          style: AppTextStyles.styleRegular11(context),
        ),
      ],
    );
  }
}
