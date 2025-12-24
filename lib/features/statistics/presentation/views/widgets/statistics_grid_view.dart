import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/statistics_grid_view_card.dart';

class StatisticsGridView extends StatelessWidget {
  const StatisticsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الإحصائيات',
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: SizeConfig.h(15)),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Statistics.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio:
                SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
                ? 0.90
                : SizeConfig.screenWidth == 800
                ? 1.05
                : SizeConfig.screenWidth > 1000
                ? 1.20
                : SizeConfig.screenWidth > 800
                ? 1.1 // SizeConfig.screenHeight / SizeConfig.screenWidth * 0.60
                : 0.94,
            crossAxisSpacing: SizeConfig.w(6),
            mainAxisSpacing: SizeConfig.h(15),
          ),

          itemBuilder: (_, i) => StatisticsGridViewCard(model: Statistics[i]),
        ),
      ],
    );
  }
}
