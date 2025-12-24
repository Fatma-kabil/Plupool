import 'package:flutter/widgets.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/dashboard_card.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'العملاء والباقات',
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: SizeConfig.h(15)),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dashboarditems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SizeConfig.w(4),
            mainAxisSpacing: SizeConfig.h(15),
            childAspectRatio:
                SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
                ? 2.3
                : SizeConfig.screenWidth == 800
                ? 2.5
                : SizeConfig.screenWidth > 800
                ? 3 // SizeConfig.screenHeight / SizeConfig.screenWidth * 0.60
                : 2.5, // مهم عشان نفس شكل التصميم
          ),
          itemBuilder: (context, index) {
            return DashboardCard(item: dashboarditems[index]);
          },
        ),
      ],
    );
  }
}
