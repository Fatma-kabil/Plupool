import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/services/data/models/pool_model.dart';
import 'package:plupool/features/services/presentation/views/widgets/pool_card.dart';

class PoolsTypesSection extends StatelessWidget {
  const PoolsTypesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'أنواع الحمامات المتاحة',
          style: AppTextStyles.styleSemiBold20(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: 20),
        PoolCard(
          pool: PoolModel(
            title: " حمام السباحة الأوفر فلو - Overflow Pool",

            description: "نظام متطور بيخلي المياه تنساب من كل الجوانب لحوض جانبي، وبترجع تاني للحمام بعد فلترتها.",
            features: [" مظهر فاخر وسطح مياه ثابت على مستوى الأرضية", " تنقية المياه باستمرار مما يعطي امانصحي اكثر وتقليل البكتيريا", "  مناسب لـ: الفيلات الفخمة، الفنادق، والمنتجعات السياحية."],
            videoUrl: "assets/videos/pool.mp4",

            // لاحظ هنا
          ),
        ),
      ],
    );
  }
}
