import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';

/// كارت يعرض تفاصيل الطلب بشكل نظيف ومنسق
class ServiceRequestCard extends StatelessWidget {
  final ServiceRequest request;

  const ServiceRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(request.status);

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
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                _buildStatusLabel(colors, context),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildTitle(context),
                    const SizedBox(height: 4),
                    _buildDateRow(context),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),
            _buildUserSection(context),
          ],
        ),
      ),
    );
  }

  /// ويدجت لعرض حالة الطلب
  Widget _buildStatusLabel(Map<String, dynamic> colors, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: colors['labelBg'],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        getStatusText(request.status),
        style: AppTextStyles.styleSemiBold13(
          context,
        ).copyWith(color: colors['labelText']),
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

  /// ويدجت للتاريخ والوقت
  Widget _buildDateRow(BuildContext context) => Row(
    textDirection: TextDirection.rtl,
    children: [
      const Icon(Icons.calendar_today, size: 12, color: Color(0xff999999)),
      const SizedBox(width: 6),
      Text(
        textDirection: TextDirection.rtl,
        '${request.date}   - ${request.time}',
        style: AppTextStyles.styleRegular13(
          context,
        ).copyWith(color: Color(0xff999999)),
      ),
    ],
  );

  /// ويدجت للمستخدم والموقع
  Widget _buildUserSection(BuildContext context) => Row(
    textDirection: TextDirection.rtl,
    children: [
      CircleAvatar(radius: 16, backgroundImage: AssetImage(request.userImage)),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              request.userName,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
            const SizedBox(height: 2),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 18,
                  color: Color(0xff999999),
                ),
                //  const SizedBox(width: 3),
                Text(
                  request.location,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Color(0xff999999)),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
