import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_data_time_row.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_request_header.dart';

class ServiceCard extends StatelessWidget {
  final ServiceRequest request;

  const ServiceCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(request.status);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServiceRequestHeader(
            stutscolor: colors['labelBg'],
            textcolor: colors['labelText'],
            request: request,
          ),
          const SizedBox(height: 4),

          if (request.progress != null) ...[
            const SizedBox(height: 12),
            _buildProgressSection(),
          ],
          if (request.nextVisitDay != null) ...[
            const SizedBox(height: 12),
            _buildReminderSection(),
          ],
        ],
      ),
    );
  }

  Column _buildProgressSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${(request.progress! * 100).toInt()}%",
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              request.visits ?? "",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: request.progress,
            minHeight: 6,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          ),
        ),
      ],
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
