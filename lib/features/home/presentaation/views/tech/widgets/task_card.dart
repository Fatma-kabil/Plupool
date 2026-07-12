import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/location_btn.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_data_time_row.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';

class TeskCard extends StatelessWidget {
  final TaskEntity task;

  const TeskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(mapApiStatus(task.status));

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(10)),
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
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                    const SizedBox(height: 4),

                    BuildDataTimeRow(task: task),
                  ],
                ),
                const Spacer(),
                buildStatusLabel(colors, context, mapApiStatus(task.status)),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              textDirection: TextDirection.rtl,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: task.customerAvatar ?? '',
                    width: SizeConfig.w(32),
                    height: SizeConfig.w(32),
                    fit: BoxFit.cover,
                    placeholder: (_, __) => SizedBox(
                      width: SizeConfig.w(32),
                      height: SizeConfig.w(32),
                      child: Center(
                        child: SizedBox(
                          width: SizeConfig.w(14),
                          height: SizeConfig.w(14),
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (_, __, ___) => CircleAvatar(
                      radius: SizeConfig.w(16),
                      child: Icon(Icons.person, size: SizeConfig.w(18)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.customerName,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: const Color(0xff555555)),
                    ),

                    const SizedBox(height: 2),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Color(0xff999999),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          task.locationName,
                          style: AppTextStyles.styleRegular13(
                            context,
                          ).copyWith(color: const Color(0xff999999)),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                LocationBtn(location: task.locationAddress, colors: colors),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
