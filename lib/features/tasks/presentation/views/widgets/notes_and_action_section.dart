import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';

class NotesAndActionsSection extends StatelessWidget {
  final TextEditingController notesController;
  final VoidCallback onSave;

  const NotesAndActionsSection({
    super.key,
    required this.notesController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
       textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الملاحظات",
          style: AppTextStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: SizeConfig.h(8)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.w(10)),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: NoteTextField(
            size:SizeConfig.isWideScreen? SizeConfig.w(10):SizeConfig.w(20),
            controller: notesController,
            onChanged: (_) {},
          ),
        ),
        SizedBox(height: SizeConfig.h(15)),
        Text(
          textDirection: TextDirection.rtl,
          "**برجاء تحري الدقة وحفظ البيانات قبل الحفظ",
          style: AppTextStyles.styleSemiBold13(context)
              .copyWith(color: const Color(0xffC0303A)),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: SizeConfig.h(25)),
        Column(
          children: [
            CustomTextBtn(text:"حفظ" ,onPressed: onSave,width: double.infinity,),
           
            SizedBox(height: SizeConfig.h(12)),
            CustomOutlinedBtn(
              text: "إلغاء",
             
              trailing: Icon(
                Icons.cancel_outlined,
                color: AppColors.kprimarycolor,
                size: SizeConfig.w(18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
