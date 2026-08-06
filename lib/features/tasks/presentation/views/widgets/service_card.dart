import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/domain/entities/technician_service_item_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/reminder_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_request_header.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.request});

  final ServiceItemEntity request;

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(mapApiStatus(request.status));

    return Container(
      padding: EdgeInsets.all(SizeConfig.w(14)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServiceRequestHeader(
            stutscolor: colors['labelBg'],
            textcolor: colors['labelText'],
            request: request,
          ),

          SizedBox(height: SizeConfig.h(4)),

          if (request.visits.isNotEmpty) ...[
            SizedBox(height: SizeConfig.h(12)),
            ProgressSection(
              progress: request.completedVisits,
              visits: request.visits.length,
              status: mapApiStatus(request.status),
              progressRatio: request.progressPercentage / 100,
            ),
          ],

          if (request.nextVisit != null) ...[
            SizedBox(height: SizeConfig.h(12)),
            ReminderSection(
              date: request.nextVisit!.date,
              time: request.nextVisit!.time,
            ),
          ],
        ],
      ),
    );
  }
}
