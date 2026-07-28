import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/myPool/domain/entities/pool_details_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/custom_divider.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/pool_info_card.dart';

class CompanyCusPoolInfoRow extends StatelessWidget {
  const CompanyCusPoolInfoRow({
    super.key,
    required this.poolDetails,
  });

  final PoolDetailsEntity? poolDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PoolInfoCard(
            title: "نوع المسبح",
            value: poolDetails?.poolTypeName ?? "-",
            color: Colors.transparent,
            iconcolor: const Color(0xffCCE4F0),
            icon: Icons.pool,
            titleTextStyle: AppTextStyles.styleBold14(context)
                .copyWith(color: const Color(0xffF6F6F6)),
            valueTextStyle: AppTextStyles.styleSemiBold13(context)
                .copyWith(color: const Color(0xffD4D4D4)),
            h2: 5,
          ),
        ),
        const CustomDivider(h: 60),
        Expanded(
          child: PoolInfoCard(
            title: "الأبعاد",
            value: poolDetails?.dimensions ?? "0 × 0 × 0",
            color: Colors.transparent,
            iconcolor: const Color(0xffFFBF68),
            icon: Icons.straighten,
            titleTextStyle: AppTextStyles.styleBold14(context)
                .copyWith(color: const Color(0xffF6F6F6)),
            valueTextStyle: AppTextStyles.styleSemiBold13(context)
                .copyWith(color: const Color(0xffD4D4D4)),
            h2: 5,
          ),
        ),
        const CustomDivider(h: 60),
        Expanded(
          child: PoolInfoCard(
            title: "الحجم",
            value: "${poolDetails?.volumeLiters ?? 0} لتر",
            color: Colors.transparent,
            iconcolor: const Color(0xffEA5A65),
            icon: Icons.square_foot,
            titleTextStyle: AppTextStyles.styleBold14(context)
                .copyWith(color: const Color(0xffF6F6F6)),
            valueTextStyle: AppTextStyles.styleSemiBold13(context)
                .copyWith(color: const Color(0xffD4D4D4)),
            h2: 5,
          ),
        ),
      ],
    );
  }
}