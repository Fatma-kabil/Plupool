import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/domain/entities/technician_service_item_entity.dart';

class ServiceRequestHeader extends StatelessWidget {
  const ServiceRequestHeader({
    super.key,
    required this.stutscolor,
    required this.textcolor,
    required this.request,
  });

  final Color stutscolor;
  final Color textcolor;
  final ServiceItemEntity request;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              request.title,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            SizedBox(height: SizeConfig.h(4)),

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
                  '${formatArabicDateOnly(request.scheduledDate)} - ${formatTimeArabic3(request.scheduledTime)}',
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: const Color(0xff999999)),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(10),
            vertical: SizeConfig.h(4),
          ),
          decoration: BoxDecoration(
            color: stutscolor,
            borderRadius: BorderRadius.circular(SizeConfig.w(5)),
          ),
          child: Text(
            request.statusLabel,
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: textcolor),
          ),
        ),
      ],
    );
  }
}
