import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as intl;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/pool_details_row.dart';
import 'package:plupool/features/maintenance/data/models/requested_maintenance_card_model.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/requested_crd_header.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/service_card_row.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class RequestedConstructionCard extends StatefulWidget {
  const RequestedConstructionCard({super.key, required this.model});
  final RequestedMaintenanceCardModel model;

  @override
  State<RequestedConstructionCard> createState() =>
      _RequestedConstructionCardState();
}

class _RequestedConstructionCardState extends State<RequestedConstructionCard> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.model.statu;
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = intl.DateFormat('EEEE : yyyy/MM/d – hh:mm a', 'ar')
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
            RequestedCardHeader(model: widget.model, date: date, time: time),

            SizedBox(height: SizeConfig.h(8)),
            Divider(color: AppColors.textFieldBorderColor),
            SizedBox(height: SizeConfig.h(8)),

            ServiceCardRow(title: "اليوم المقترح:", value: date),
            SizedBox(height: SizeConfig.h(5)),

            ServiceCardRow(title: "الوقت المقترح:", value: time),
            SizedBox(height: SizeConfig.h(12)),
            PoolDetailsRow(),

            SizedBox(height: SizeConfig.h(12)),
            Divider(color: AppColors.textFieldBorderColor),
            SizedBox(height: SizeConfig.h(8)),

            /// ---- Status Selector + Delete ----
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " تعديل حالة الطلب ",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: StatusSelector<String>(
                        selected: selected,
                        items: const ["جديد", "تم التواصل"],
                        displayText: (status) => status,
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
                            text: "هل أنت متأكد من حذف هذا الطلب؟",
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
