import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_request_header.dart';

class ServiceCard extends StatelessWidget {
  final ServiceRequest request;

  const ServiceCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(request.status);
    return Container(
      padding: EdgeInsets.all(SizeConfig.w(14)),
      decoration: BoxDecoration(
        //     color: Colors.white,
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

          if (request.progress != null && request.visits != null) ...[
            SizedBox(height: SizeConfig.h(12)),
            ProgressSection(
              progress: request.progress!, // ده آمن دلوقتي عشان اتحققنا فوق
              visits: request.visits!,
            ),
          ],

          if (request.nextVisitDay != null) ...[
            const SizedBox(height: 12),
            _buildReminderSection(),
          ],
        ],
      ),
    );
  }

  Container _buildReminderSection() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF03A9F4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "تذكير",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "الزيارة القادمة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  "",
                  //    "$request  |  $nextVisitDate  |  $nextVisitTime",
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.calendar_today, color: Colors.blueAccent, size: 20),
        ],
      ),
    );
  }
}
