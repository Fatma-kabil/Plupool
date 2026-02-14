import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/reports/data/models/report_model.dart';

import 'package:intl/intl.dart' as intl;
import 'package:plupool/features/reports/presentation/views/widgets/admin_drawer_report_header_card.dart';
import 'package:plupool/features/reports/presentation/views/widgets/report_card_row.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class AdminDrawerReportCard extends StatefulWidget {
  const AdminDrawerReportCard({super.key, required this.model});
  final ReportModel model;

  @override
  State<AdminDrawerReportCard> createState() => _AdminDrawerReportCardState();
}

class _AdminDrawerReportCardState extends State<AdminDrawerReportCard> {
  @override
  Widget build(BuildContext context) {
    MessageStatus selected = widget.model.status;
    final formattedDate = intl.DateFormat('EEEE  yyyy/MM/d – hh:mm a', 'ar')
        .format(DateTime(2025, 12, 1, 12, 00))
        .replaceAll('ص', 'صباحاً')
        .replaceAll('م', 'مساءً');

    final parts = formattedDate.split('–');
    final date = parts[0].trim();
    final time = parts.length > 1 ? parts[1].trim() : '';

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(15),
          vertical: SizeConfig.h(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---- Header ----
            AdminDrawerReportHeaderCard(status: widget.model.status),
            SizedBox(height: SizeConfig.h(10)),

            ReportCardRow(title: "نوع الخدمة", value: "باقة شهرية"),
            SizedBox(height: SizeConfig.h(5)),
            ReportCardRow(title: "رقم الزياره", value: "4"),
            SizedBox(height: SizeConfig.h(5)),
            ReportCardRow(title: "اسم الفني", value: "أحمد محمد"),
            SizedBox(height: SizeConfig.h(5)),

            ReportCardRow(title: "تاريخ ووقت الزيارة", value: "$date - $time"),

            SizedBox(height: SizeConfig.h(8)),
            Divider(color: AppColors.textFieldBorderColor),
            SizedBox(height: SizeConfig.h(8)),

            /// ---- Status Selector + Delete ----
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " تعديل حالة البلاغ ",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: StatusSelector<MessageStatus>(
                        selected: selected,
                        items: const [
                          MessageStatus.pending,
                          MessageStatus.solved,
                          MessageStatus.newer,
                        ],
                        displayText: (status) => statusText(status),
                        onChanged: (val) {
                          setState(() => selected = val);
                        },
                      ),
                    ),

                    SizedBox(width: SizeConfig.w(35)),

                    GestureDetector(
                      onTap: () => {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => const DeleteOrderCard(
                            text: "هل أنت متأكد من حذف هذا البلاغ ؟",
                          ),
                        ),
                      },
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.w(6)),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFAD7DA),
                        ),
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: Color(0xffE63946),
                          size: SizeConfig.w(20),
                        ),
                      ),
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
}
