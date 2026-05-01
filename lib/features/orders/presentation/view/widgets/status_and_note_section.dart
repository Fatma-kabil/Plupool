import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';
import 'package:plupool/features/orders/domain/entities/order_status.dart';
import 'package:plupool/features/orders/domain/entities/order_status_extension.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

// ignore: must_be_immutable
class StatusAndNoteSection extends StatefulWidget {
  StatusAndNoteSection({super.key, required this.statu});
  String statu;

  @override
  State<StatusAndNoteSection> createState() => _StatusAndNoteSectionState();
}

class _StatusAndNoteSectionState extends State<StatusAndNoteSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تعديل حالة الطلب",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: Color(0xff333333)),
        ),
        SizedBox(height: SizeConfig.h(8)),
        StatusSelector<OrderStatus>(
          selected: OrderStatus.values.firstWhere(
            (e) => e.arName == widget.statu, // 🔥 تحويل من العربي
            orElse: () => OrderStatus.PENDING,
          ),

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
            setState(() {
              widget.statu = val.arName; // ✅ نخزن عربي
            });
          },
        ),
        SizedBox(height: SizeConfig.h(20)),
        Text(
          "ملاحظات داخلية",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: Color(0xff333333)),
        ),
        SizedBox(height: SizeConfig.h(8)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.w(10)),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: NoteTextField(
            size: SizeConfig.isWideScreen ? SizeConfig.w(10) : SizeConfig.w(20),
            controller: TextEditingController(),
            text: "أكتب ملاحظات الفريق هنا.....",
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}
