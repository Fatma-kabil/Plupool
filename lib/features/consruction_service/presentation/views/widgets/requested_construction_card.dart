import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/pool_details_row.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/requested_crd_header.dart';
import 'package:plupool/features/services/domain/entities/service_request_entity.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/delete_request_service_btn.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/service_card_row.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class RequestedConstructionCard extends StatefulWidget {
  const RequestedConstructionCard({super.key, required this.model});
  final ServiceRequestEntity model;

  @override
  State<RequestedConstructionCard> createState() =>
      _RequestedConstructionCardState();
}

class _RequestedConstructionCardState extends State<RequestedConstructionCard> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = // تهيئة القيمة هنا
        widget.model.status;
  }

  @override
  Widget build(BuildContext context) {
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
            RequestedCardHeader(model: widget.model),
            SizedBox(height: SizeConfig.h(8)),
            Divider(color: AppColors.textFieldBorderColor),
            SizedBox(height: SizeConfig.h(8)),

            ServiceCardRow(
              title: "اليوم المقترح:",
              value: widget.model.suggestedDate,
            ),
            SizedBox(height: SizeConfig.h(5)),

            ServiceCardRow(
              title: "الوقت المقترح:",
              value: widget.model.suggestedTime,
            ),
            SizedBox(height: SizeConfig.h(12)),
            PoolDetailsRow(model: widget.model,),

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

                     DeleteRequestServiceBtn(id:  widget.model.id,),
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
