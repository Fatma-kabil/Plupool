import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/services/data/models/pool_reservation_model.dart';

class PoolTypeSection extends StatelessWidget {
  final PoolReservation reservation;

  const PoolTypeSection({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Text(
          'نوع حمام السباحة',
          style: AppTextStyles.styleBold16(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 15),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(
              'assets/icons/pool-ladder.svg',
              height: 15,
              width: 15,
            ),
            const SizedBox(width: 5),
            Text(
              reservation.title,
              style: AppTextStyles.styleRegular13(context)
                  .copyWith(color: const Color(0xff006398)),
            ),
          ],
        ),
      ],
    );
  }
}
