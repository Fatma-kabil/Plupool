import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
class DateRow extends StatelessWidget {
  const DateRow({super.key, required this.offer});

  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    String text;

    if (offer.status == "active") {
      text = "العرض ساري حتى ";
    } else if (offer.status == "inactive") {
      text = "سيبدأ يوم ";
    } else {
      text = "تم إنهاء العرض يوم ";
    }

    final date = offer.status == "active"
        ? offer.endDate
        : offer.status == "upcoming"
            ? offer.startDate
            : offer.endDate;

    return Row(
      children: [
        Icon(
          Icons.calendar_month_outlined,
          size: SizeConfig.w(12),
          color: const Color(0xff525252),
        ),
        SizedBox(width: SizeConfig.w(4)),

        Text(
          text,
          style: AppTextStyles.styleRegular12(context),
        ),

        Text(
          formatDate(date),
          style: AppTextStyles.styleRegular12(context),
        ),
      ],
    );
  }
}