import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';
import 'package:plupool/features/orders/domain/entities/order_status.dart';
import 'package:plupool/features/orders/domain/entities/order_status_extension.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class StatusAndNoteSection extends StatelessWidget {
  const StatusAndNoteSection({
    super.key,
    required this.status,
    required this.onStatusChanged,
    required this.notesController,
  });

  final String status;
  final Function(String) onStatusChanged;
  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// STATUS
        Text(
          "تعديل حالة الطلب",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: const Color(0xff333333)),
        ),

        SizedBox(height: SizeConfig.h(8)),

        StatusSelector<OrderStatus>(
          selected: OrderStatusExtension.fromString(status),

          items: const [
            OrderStatus.PENDING,
            OrderStatus.PROCESSING,
            OrderStatus.SHIPPED,
            OrderStatus.DELIVERED,
            OrderStatus.CONFIRMED,
            OrderStatus.CANCELLED,
          ],

          displayText: (status) => status.arName,

          onChanged: (val) {
            onStatusChanged(val.apiValue); // 🔥 يرجع إنجليزي
          },
        ),

        SizedBox(height: SizeConfig.h(20)),

        /// NOTES
        Text(
          "ملاحظات داخلية",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: const Color(0xff333333)),
        ),

        SizedBox(height: SizeConfig.h(8)),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.w(10)),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: NoteTextField(
            controller: notesController,
            size: SizeConfig.isWideScreen ? SizeConfig.w(10) : SizeConfig.w(20),
            text: "أكتب ملاحظات الفريق هنا.....",
          ),
        ),
      ],
    );
  }
}
