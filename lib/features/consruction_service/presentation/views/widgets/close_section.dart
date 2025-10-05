import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/done_card.dart';

class CloseSection extends StatelessWidget {
  const CloseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,

      children: [
        CustomTextBtn(
          text: "تأكيد  الحجز",
          onPressed: () {
              Navigator.of(context).pop(); // 👈 يقفل الكارد اللي مفتوحة
            showDialog(context: context, builder: (_) => DoneCard());
          },
          padding: 8,
        ),
        Spacer(),
        CustomOutlinedBtn(
          text: "تعديل",
          trailing: Icon(
            Icons.edit_note_sharp,
            color: AppColors.kprimarycolor,
            size: 24,
          ),
        ),
      ],
    );
  }
}
