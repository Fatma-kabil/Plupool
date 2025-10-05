import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/consruction_service/data/models/pool_reservation_model.dart';

class DimensionsSection extends StatelessWidget {
  final PoolReservation reservation;

  const DimensionsSection({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.rtl,
      children: [
        _buildDimension(
          context,
          title: 'العرض',
          value: reservation.width,
          iconPath: 'assets/icons/width.svg',
        ),
        _buildDimension(
          context,
          title: 'الطول',
          value: reservation.depth,
          iconPath: 'assets/icons/tall.svg',
        ),
        _buildDimension(
          context,
          title: 'الارتفاع',
          value: reservation.height,
          iconPath: 'assets/icons/height.svg',
        ),
      ],
    );
  }

  Widget _buildDimension(BuildContext context,
      {required String title,
      required double value,
      required String iconPath}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: AppTextStyles.styleBold16(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 10),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 15,
              width: 15,
              color: AppColors.kprimarycolor,
            ),
            const SizedBox(width: 5),
            Text(
              "$value",
              style: AppTextStyles.styleRegular13(context)
                  .copyWith(color: const Color(0xff006398)),
            ),
            const SizedBox(width: 3),
            Text(
              "متر",
              style: AppTextStyles.styleRegular13(context)
                  .copyWith(color: const Color(0xff006398)),
            ),
          ],
        ),
      ],
    );
  }
}
