import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/pool_info_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/section_header.dart';

class CustomerProfileViewMiddleCard extends StatelessWidget {
  const CustomerProfileViewMiddleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SectionHeader(
              icon: Icons.pool_outlined,
              title: "معلومات حمام السباحة",
            ),
            Spacer(),
             GestureDetector(
                onTap: () {
                  context.push('/editcustomerpoolinfo');
                },
                child: Text(
                  "تعديل",
                  style: AppTextStyles.styleBold16(context).copyWith(
                    color: AppColors.kprimarycolor,
                    decoration: TextDecoration.underline, // ✅ الخط تحت النص
                  ),
                ),
              ),
          ],
        ),
       SizedBox(height: SizeConfig.h(18),),
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PoolInfoCard(
                title: "النوع",
                value: "أوفر فلو",
                color: Color(0xFFCDF7EC),
                iconcolor: Color(0xff06D6A0),
                icon: Icons.pool,
              ),
            ),
            SizedBox(width: SizeConfig.w(8)),
            Expanded(
              child: PoolInfoCard(
                title: "الأبعاد",
                value: "12م × 6م × 1.8م",
                color: Color(0xFFCCE4F0),
                iconcolor: Color(0xff2B8EC2),
                icon: Icons.straighten,
              ),
            ),
            SizedBox(width: SizeConfig.w(8)),
            Expanded(
              child: PoolInfoCard(
                title: "الحجم",
                value: "129,600 لتر",
                color: Color(0xFFFFECD2),
                iconcolor: Color(0xffFF9F1C),
                icon: Icons.square_foot,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
