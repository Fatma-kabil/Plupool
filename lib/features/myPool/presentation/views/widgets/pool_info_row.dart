
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/custom_divider.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/pool_info_card.dart';

class PoolInfoRow extends StatelessWidget {
  const PoolInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PoolInfoCard(
            title: "نوع المسبح",
            value: "أوفر فلو",
            color: Colors.transparent,
            iconcolor: Color(0xffCCE4F0),
            icon: Icons.pool,
            titleTextStyle: AppTextStyles.styleBold14(context).copyWith(color: Color(0xffF6F6F6)),
            valueTextStyle: AppTextStyles.styleSemiBold13(context).copyWith(color: Color(0xffD4D4D4)),
              h2:5
          ),
        ),
        CustomDivider(h: 60,),
        Expanded(
          child: PoolInfoCard(
            title: "الأبعاد",
            value: "12م × 6م × 1.8م",
           color: Colors.transparent,
            iconcolor: Color(0xffFFBF68),
            icon: Icons.straighten,
             titleTextStyle: AppTextStyles.styleBold14(context).copyWith(color: Color(0xffF6F6F6)),
            valueTextStyle: AppTextStyles.styleSemiBold13(context).copyWith(color: Color(0xffD4D4D4)),
          //  h1: 8,
            h2:5
          ),
        ),
        CustomDivider(h: 60,),
        Expanded(
          child: PoolInfoCard(
            title: "الحجم",
            value: "129,600 لتر",
             color: Colors.transparent,
            iconcolor: Color(0xffEA5A65),
            icon: Icons.square_foot,
             titleTextStyle: AppTextStyles.styleBold14(context).copyWith(color: Color(0xffF6F6F6)),
            valueTextStyle: AppTextStyles.styleSemiBold13(context).copyWith(color: Color(0xffD4D4D4)),
              h2:5
          ),
        ),
      ],
    );
  }
}
