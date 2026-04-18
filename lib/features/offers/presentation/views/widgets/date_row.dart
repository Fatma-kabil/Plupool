import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';

class DateRow extends StatelessWidget {
  const DateRow({super.key, required this.offer});

  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'dd MMMM yyyy',
      'ar',
    ).format(offer.endDate);

    return Row(
      children: [
        Icon(
          Icons.calendar_month_outlined,
          size: SizeConfig.w(12),
          color: const Color(0xff525252),
        ),
        SizedBox(width: SizeConfig.w(4)),

        Text(
          'العرض ساري حتى ',
          style: AppTextStyles.styleRegular11(context),
        ),

        Text(
          formattedDate,
          style: AppTextStyles.styleRegular11(context),
        ),
      ],
    );
  }
}