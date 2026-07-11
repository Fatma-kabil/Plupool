import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/report_technician_absence.dart';

class VisitCard extends StatelessWidget {
  const VisitCard({
    super.key,
    required this.progress,
    required this.visits,
    required this.status,
    required this.date,
    required this.bookingId,
    required this.technicianNames,
    required this.technicianImages,
    this.reportTechnicianAbsence = false,
  });

  final String? date;
  final int progress;
  final int visits;
  final int bookingId;

  final List<String> technicianNames;
  final List<String?> technicianImages;

  final RequestStatus status;
  final bool reportTechnicianAbsence;

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textDirection: TextDirection.ltr,
                      "الزيارة ${toArabicNumbers(visits.toString())}/${toArabicNumbers(progress.toString())}",
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: SizeConfig.w(12),
                          color: const Color(0xff999999),
                        ),
                        SizedBox(width: SizeConfig.w(6)),
                        Text(
                          date != null && date!.isNotEmpty
                              ? formatArabicDateOnly(date!)
                              : "-",
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

            SizedBox(height: SizeConfig.h(14)),

            /// Technicians
            Wrap(
              spacing: SizeConfig.w(12),
              runSpacing: SizeConfig.h(12),
              children: List.generate(technicianNames.length, (index) {
                final image = technicianImages.length > index
                    ? technicianImages[index]
                    : null;

                return SizedBox(
                  width: (SizeConfig.screenWidth - SizeConfig.w(72)) / 2,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      CircleAvatar(
                        radius: SizeConfig.w(16),
                        backgroundColor: const Color(0xffF1F1F1),
                        backgroundImage:
                            image != null && image.trim().isNotEmpty
                            ? NetworkImage(image)
                            : null,
                        child: image == null || image.trim().isEmpty
                            ? Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: SizeConfig.w(18),
                              )
                            : null,
                      ),

                      SizedBox(width: SizeConfig.w(8)),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              technicianNames[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.styleSemiBold16(
                                context,
                              ).copyWith(color: const Color(0xff555555)),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.handyman,
                                  size: SizeConfig.w(14),
                                  color: const Color(0xff999999),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "فني",
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
              }),
            ),

            if (reportTechnicianAbsence) ...[
              SizedBox(height: SizeConfig.h(16)),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) =>
                          ReportTechnicianAbsence(bookingId: bookingId),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(8),
                      vertical: SizeConfig.h(6),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textFieldBorderColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.report_problem,
                          size: SizeConfig.w(15),
                          color: const Color(0xffFF9F1C),
                        ),
                        SizedBox(width: SizeConfig.w(4)),
                        Text(
                          "الإبلاغ عن غياب الفني",
                          style: AppTextStyles.styleMedium13(
                            context,
                          ).copyWith(color: const Color(0xff555555)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
