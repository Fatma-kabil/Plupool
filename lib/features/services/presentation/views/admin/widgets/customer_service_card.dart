import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/services/data/models/customer_service_card_model.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/date_row.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/service_card_footer.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/service_card_row.dart';

class CustomerServiceCard extends StatelessWidget {
  const CustomerServiceCard({super.key, required this.request});
  final CustomerServiceCardModel request;

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(request.statu);

    return Container(
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
                    Text(
                      "طلب رقم #${request.orderno}",
                      style: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: Color(0xff333333)),
                    ),

                    buildStatusLabel(colors, context, request.statu),
                  ],
                ),
             //   SizedBox(height: 8),
                DateRow(date: request.date),
              ],
            ),

            const SizedBox(height: 12),

            ServiceCardRow(title: "نوع الخدمة:", value: request.service),
            const SizedBox(height: 5),
             ServiceCardRow(title: " العميل:", value: "احمد محمد"),
            const SizedBox(height: 5),
            ServiceCardRow(title: "الفنيين:", value: request.techs),
            const SizedBox(height: 8),
            ServiceCardFooter()
            // ---- بيانات المستخدم + زرار الموقع ----
          ],
        ),
      ),
    );
  }
}
