import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
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
          title: 'الطول',
          value: reservation.tall,
          iconPath: 'assets/icons/tall.svg',
        ),
        _buildDimension(
          context,
          title: 'العرض',
          value: reservation.width,
          iconPath: 'assets/icons/width.svg',
        ),
        _buildDimension(
          context,
          title: 'العمق',
          value: reservation.depth,
          iconPath: 'assets/icons/depth.svg',
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
              height: SizeConfig.h(15),
              width: SizeConfig.w(15),
              color: AppColors.kprimarycolor,
            ),
             SizedBox(width: SizeConfig.h(5)),
            Text(
              "$value",
              style: AppTextStyles.styleRegular13(context)
                  .copyWith(color: const Color(0xff006398)),
            ),
             SizedBox(width: SizeConfig.h(3)),
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
