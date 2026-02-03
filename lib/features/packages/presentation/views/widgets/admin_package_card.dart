import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/packages/data/models/package_model.dart';
import 'package:plupool/features/packages/presentation/views/widgets/admin_package_card_footer.dart';
import 'package:plupool/features/packages/presentation/views/widgets/date_row_package.dart';
import 'package:plupool/features/packages/presentation/views/widgets/visits_section.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/service_card_row.dart';

class AdminPackageCard extends StatelessWidget {
  const AdminPackageCard({super.key, required this.model});
  final PackageModel model;

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(model.status);

    return GestureDetector(
      onTap: () {
        context.push('/visitview');
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    model.packageType,
                    style: AppTextStyles.styleBold16(
                      context,
                    ).copyWith(color: Color(0xff333333)),
                  ),

                  buildStatusLabel(colors, context, model.status),
                ],
              ),
              //   SizedBox(height: 8),
              DateRowPackage(date: model.finishedDate),

              const SizedBox(height: 12),

              ServiceCardRow(title: " العميل:", value: "احمد حسن"),
              const SizedBox(height: 5),
              ServiceCardRow(title: "الفنيين:", value: "علي حسين - احمد كامل"),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(10),
                  vertical: SizeConfig.h(12),
                ),
                child: Divider(),
              ),
              VisitsSection(model: model),
              SizedBox(height: SizeConfig.h(12)),
              AdminPackageCardFooter(),
              // ---- بيانات المستخدم + زرار الموقع ----
            ],
          ),
        ),
      ),
    );
  }
}
