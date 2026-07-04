import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';

class MyPoolTaskCard extends StatelessWidget {
  const MyPoolTaskCard({super.key, required this.service});

  final UserServiceEntity service;

  @override
  Widget build(BuildContext context) {
    final status = mapApiStatus(service.status);
    final colors = RequestStatusColors.getColors(status);

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
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(context),
                    const SizedBox(height: 4),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: SizeConfig.w(12),
                          color: const Color(0xff999999),
                        ),
                        SizedBox(width: SizeConfig.w(6)),
                        Text(
                          textDirection: TextDirection.rtl,
                          "${formatArabicDateOnly(service.scheduledDate)} - ${formatTimeArabic3(service.scheduledTime)}",
                          style: AppTextStyles.styleRegular13(
                            context,
                          ).copyWith(color: const Color(0xff999999)),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                buildStatusLabel(colors, context, status),
              ],
            ),
            const SizedBox(height: 10),

            Wrap(
              alignment: WrapAlignment.start,
              textDirection: TextDirection.rtl,
              spacing: SizeConfig.w(16),
              runSpacing: SizeConfig.h(12),
              children: service.technicians.map((technician) {
                return SizedBox(
                  width: service.technicians.length == 1
                      ? double.infinity
                      : MediaQuery.of(context).size.width * 0.38,

                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: SizeConfig.w(16),
                        backgroundImage: technician.profileImage != null
                            ? NetworkImage(technician.profileImage!)
                            : null,
                        child: technician.profileImage == null
                            ? const Icon(Icons.person, color: Colors.grey)
                            : null,
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              technician.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.styleSemiBold16(
                                context,
                              ).copyWith(color: const Color(0xff555555)),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Icon(
                                  Icons.handyman,
                                  size: SizeConfig.w(14),
                                  color: const Color(0xff999999),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  'فني',
                                  style: AppTextStyles.styleRegular13(
                                    context,
                                  ).copyWith(color: const Color(0xff999999)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
    service.title,
    style: AppTextStyles.styleSemiBold16(
      context,
    ).copyWith(color: AppColors.ktextcolor),
  );
}
