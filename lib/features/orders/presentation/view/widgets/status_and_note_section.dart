import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';
import 'package:plupool/features/orders/domain/entities/order_status.dart';
import 'package:plupool/features/orders/domain/entities/order_status_extension.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_selector.dart';

class StatusAndNoteSection extends StatefulWidget {
   StatusAndNoteSection({super.key, required this.statu});
   OrderStatus statu;

  @override
  State<StatusAndNoteSection> createState() => _StatusAndNoteSectionState();
}

class _StatusAndNoteSectionState extends State<StatusAndNoteSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("تعديل حالة الطلب", style: AppTextStyles.styleSemiBold16(context).copyWith(color: Color(0xff333333))),
        SizedBox(height: SizeConfig.h(8)),
       StatusSelector<OrderStatus>(
         selected: widget.statu,
         items: const [
           OrderStatus.delivered,
           OrderStatus.onTheWay,
            OrderStatus.preparing,
            OrderStatus.cancelled,
         ],
         displayText: (status) => status.text,
         onChanged: (val) {
           setState(() => widget.statu = val);
         },
       ),
       SizedBox(height: SizeConfig.h(10)),
         Text("ملاحظات داخلية", style: AppTextStyles.styleSemiBold16(context).copyWith(color: Color(0xff333333))),
        SizedBox(height: SizeConfig.h(8)),
         Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.w(10)),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: NoteTextField(
            size:SizeConfig.isWideScreen? SizeConfig.w(10):SizeConfig.w(20),
            controller: TextEditingController(),
            text: "أكتب ملاحظات الفريق هنا.....",
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}
