import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/services/presentation/views/widgets/pool_list.dart';

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
        SizedBox(height: 10),
    
        PoolsList(),
      ],
    );
  }
}
