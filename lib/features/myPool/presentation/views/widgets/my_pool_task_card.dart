import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_data_time_row.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_user_section.dart';

class MyPoolTaskCard extends StatelessWidget {
  const MyPoolTaskCard({super.key, required this.request});
   final ServiceRequest request;

  @override
  Widget build(BuildContext context) {
   final colors = RequestStatusColors.getColors(request.status);

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        color: colors['bg'],
        border: Border.all(color: colors['border']),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(12),
        ),
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                buildStatusLabel(colors, context, request.status),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildTitle(context),
                    const SizedBox(height: 4),
                    BuildDataTimeRow(request: request),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),
            BuildUserSection(request: request),
          ],
        ),
      ),
    );
  }

  /// ويدجت لعنوان الطلب
  Widget _buildTitle(BuildContext context) => Text(
    request.title,
    style: AppTextStyles.styleSemiBold16(
      context,
    ).copyWith(color: AppColors.ktextcolor),
  );
}

  
