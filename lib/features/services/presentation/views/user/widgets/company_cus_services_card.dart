import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';

class CompanyCusServicesCard extends StatelessWidget {
  const CompanyCusServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final status = mapApiStatus("scheduled");
    final colors = RequestStatusColors.getColors(status);

    return GestureDetector(
      onTap: () {
        context.push('/companyrescuspoolview');
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
              // ---- العنوان و الحالة ----
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "أحمد القحطاني",
                            style: AppTextStyles.styleSemiBold16(
                              context,
                            ).copyWith(color: Color(0xff333333)),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: SizeConfig.w(14),
                                color: Color(0xff777777),
                              ),
                              SizedBox(width: SizeConfig.w(2)),
                              Text(
                                "الرياض - حي العليا",
                                style: AppTextStyles.styleRegular13(
                                  context,
                                ).copyWith(color: Color(0xff777777)),
                              ),
                            ],
                          ),
                        ],
                      ),

                      buildStatusLabel(colors, context, status),
                    ],
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.miscellaneous_services,
                        size: SizeConfig.w(14),
                        color: Color(0xff555555),
                      ),
                      SizedBox(width: SizeConfig.w(4)),
                      Text(
                        "نوع الخدمه : ",
                        style: AppTextStyles.styleSemiBold13(
                          context,
                        ).copyWith(color: Color(0xff555555)),
                      ),
                      Text(
                        "صيانة فلتر",
                        style: AppTextStyles.styleSemiBold13(
                          context,
                        ).copyWith(color: Color(0xff777777)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: SizeConfig.w(14),
                        color: Color(0xff555555),
                      ),
                      SizedBox(width: SizeConfig.w(4)),
                      Text(
                        " تاريخ الخدمه : ",
                        style: AppTextStyles.styleSemiBold13(
                          context,
                        ).copyWith(color: Color(0xff555555)),
                      ),
                      Text(
                        "15-10-2023",
                        style: AppTextStyles.styleSemiBold13(
                          context,
                        ).copyWith(color: Color(0xff777777)),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.h(6)),
                  Divider(),
                  SizedBox(height: SizeConfig.h(6)),
                  Row(
                    children: [
                      CustomerAvatar(imageUrl: "assets/images/user1.png"),
                      SizedBox(width: SizeConfig.w(7)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "أحمد محمد",
                            style: AppTextStyles.styleSemiBold16(
                              context,
                            ).copyWith(color: Color(0xff555555)),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.engineering_outlined,
                                size: SizeConfig.w(14),
                                color: Color(0xff999999),
                              ),
                              SizedBox(width: SizeConfig.w(4)),
                              Text(
                                "فني",
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
            ],
          ),
        ),
      ),
    );
  }
}
