import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/core/utils/functions/request_status.dart';

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
                          color: Color(0xff999999),
                        ),
                        SizedBox(width: SizeConfig.w(6)),
                        Text(
                          textDirection: TextDirection.rtl,
                          '${request.date} ',
                          style: AppTextStyles.styleRegular13(
                            context,
                          ).copyWith(color: Color(0xff999999)),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                buildStatusLabel(colors, context, request.status),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                CircleAvatar(
                  radius: SizeConfig.w(16),
                  backgroundImage: AssetImage(request.userImage!),
                ),
                SizedBox(width: SizeConfig.w(8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.userName!,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Color(0xff555555)),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                         Icons.handyman,
                          size: SizeConfig.w(14),
                          color: Color(0xff999999),
                        ),
                          const SizedBox(width: 3),
                        Text(
                          'فني ',
                          style: AppTextStyles.styleRegular13(
                            context,
                          ).copyWith(color: Color(0xff999999)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
