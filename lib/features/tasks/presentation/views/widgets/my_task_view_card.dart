import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/location_btn.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_data_time_row.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_user_section.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';

class MyTaskViewCard extends StatelessWidget {
  const MyTaskViewCard({super.key, required this.task, this.onReturn});

  final TaskEntity task;

  final Future<void> Function()? onReturn;
  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(mapApiStatus(task.status));

    return GestureDetector(
      onTap: () async {
        await context.push("/customerdetailsView", extra: task.id);

        if (onReturn != null) {
          await onReturn!();
        }
      },
      child: Container(
        width: double.infinity,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(context),
                        const SizedBox(height: 4),
                        BuildDataTimeRow(task: task),
                      ],
                    ),
                  ),
                  buildStatusLabel(colors, context, mapApiStatus(task.status)),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(child: BuildUserSection(task: task)),

                  LocationBtn(location: task.locationAddress, colors: colors),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
    task.title,
    overflow: TextOverflow.ellipsis,
    style: AppTextStyles.styleSemiBold16(
      context,
    ).copyWith(color: AppColors.ktextcolor),
  );
}
