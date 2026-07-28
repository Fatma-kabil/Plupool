import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/services/domain/entities/company_service_entity.dart';

class CompanyCusPackCard extends StatelessWidget {
  const CompanyCusPackCard({super.key, required this.package});

  final CompanyServiceEntity package;

  @override
  Widget build(BuildContext context) {
    final status = mapApiStatus(package.status);
    final colors = RequestStatusColors.getColors(status);

    return GestureDetector(
      onTap: () {
        context.push('/companyrescuspoolview',extra: package.clientId);
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
              /// العميل + الحالة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          package.clientName,
                          style: AppTextStyles.styleSemiBold16(
                            context,
                          ).copyWith(color: const Color(0xff333333)),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: SizeConfig.w(14),
                              color: const Color(0xff777777),
                            ),
                            SizedBox(width: SizeConfig.w(3)),
                            Expanded(
                              child: Text(
                                package.clientAddress.isEmpty
                                    ? "لا يوجد عنوان"
                                    : package.clientAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.styleRegular13(
                                  context,
                                ).copyWith(color: const Color(0xff777777)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  buildStatusLabel(colors, context, status),
                ],
              ),

              SizedBox(height: SizeConfig.h(10)),

              /// اسم الباقة
              Row(
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: SizeConfig.w(14),
                    color: const Color(0xff555555),
                  ),
                  SizedBox(width: SizeConfig.w(4)),
                  Text(
                    "الباقة : ",
                    style: AppTextStyles.styleSemiBold13(
                      context,
                    ).copyWith(color: const Color(0xff555555)),
                  ),
                  Expanded(
                    child: Text(
                      package.name,
                      style: AppTextStyles.styleSemiBold13(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(8)),

              /// تاريخ البداية والنهاية
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: SizeConfig.w(14),
                    color: const Color(0xff555555),
                  ),
                  SizedBox(width: SizeConfig.w(4)),
                  Text(
                    "البدء : ",
                    style: AppTextStyles.styleSemiBold13(
                      context,
                    ).copyWith(color: const Color(0xff555555)),
                  ),
                  Text(
                    formatArabicDateOnly(package.startDate ?? ""),
                    style: AppTextStyles.styleSemiBold13(
                      context,
                    ).copyWith(color: const Color(0xff777777)),
                  ),

                  const Spacer(),

                  Icon(
                    Icons.event_available_outlined,
                    size: SizeConfig.w(14),
                    color: const Color(0xff555555),
                  ),
                  SizedBox(width: SizeConfig.w(4)),
                  Text(
                    "الانتهاء : ",
                    style: AppTextStyles.styleSemiBold13(
                      context,
                    ).copyWith(color: const Color(0xff555555)),
                  ),
                  Text(
                    formatArabicDateOnly(package.endDate ?? ""),
                    style: AppTextStyles.styleSemiBold13(
                      context,
                    ).copyWith(color: const Color(0xff777777)),
                  ),
                ],
              ),

              /// عدد الزيارات
              if (package.visitsCount != null) ...[
                SizedBox(height: SizeConfig.h(8)),
                Row(
                  children: [
                    Icon(
                      Icons.repeat,
                      size: SizeConfig.w(14),
                      color: const Color(0xff555555),
                    ),
                    SizedBox(width: SizeConfig.w(4)),
                    Text(
                      "الزيارات : ",
                      style: AppTextStyles.styleSemiBold13(
                        context,
                      ).copyWith(color: const Color(0xff555555)),
                    ),
                    Text(
                          toArabicNumbers(
                            "${package.visitsCount}/${package.completedVisits}",
                          ),
                      style: AppTextStyles.styleSemiBold13(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                ),
              ],

              /// نسبة الإنجاز
              if (package.progressPercentage != null) ...[
                SizedBox(height: SizeConfig.h(10)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: package.progressPercentage! / 100,
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(
                      colors['progbar'] as Color,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.h(4)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                 toArabicNumbers(   "${package.progressPercentage!.toStringAsFixed(0)}%"),
                    style: AppTextStyles.styleRegular13(context),
                  ),
                ),
              ],

              if (package.technicians.isNotEmpty) ...[
                SizedBox(height: SizeConfig.h(8)),
                const Divider(),
                SizedBox(height: SizeConfig.h(8)),

                /// الفنيين (كل اتنين في سطر)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: package.technicians.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12,
                    childAspectRatio: 3.2,
                  ),
                  itemBuilder: (context, index) {
                    final technician = package.technicians[index];

                    return Row(
                      children: [
                        CustomerAvatar(
                          imageUrl:
                              (technician.profileImage?.isNotEmpty ?? false)
                              ? technician.profileImage!
                              : null,
                        ),
                        SizedBox(width: SizeConfig.w(8)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              SizedBox(height: SizeConfig.h(2)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_outlined,
                                    size: SizeConfig.w(13),
                                    color: const Color(0xff999999),
                                  ),
                                  SizedBox(width: SizeConfig.w(4)),
                                  Expanded(
                                    child: Text(
                                      technician.phone,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          AppTextStyles.styleRegular13(
                                            context,
                                          ).copyWith(
                                            color: const Color(0xff999999),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
