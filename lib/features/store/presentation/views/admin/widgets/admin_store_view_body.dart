import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/store/presentation/views/admin/widgets/dashboard_shortcuts_grid.dart';
import 'package:plupool/features/store/presentation/views/admin/widgets/dashboard_stats_grid.dart';

class AdminStoreViewBody extends StatelessWidget {
  const AdminStoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== Stats Title =====
          Text(
            'الاحصائيات :',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.ktextcolor),
          ),
          const SizedBox(height: 15),

          /// ===== Stats Grid =====
          const DashboardStatsGrid(),

          const SizedBox(height: 24),

          /// ===== Shortcuts Title =====
          Text(
            'الاختصارات :',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.ktextcolor),
          ),
          const SizedBox(height: 15),

          /// ===== Shortcuts Grid =====
          const DashboardShortcutsGrid(),
        ],
      ),
    );
  }
}
