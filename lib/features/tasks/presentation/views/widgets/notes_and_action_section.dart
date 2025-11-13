import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_text_field.dart';

class NotesAndActionsSection extends StatelessWidget {
  const NotesAndActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الملاحظات",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        SizedBox(height: SizeConfig.h(8)),

        // 🟦 حقل الملاحظات
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.w(10)),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: NoteTextField(
            size: SizeConfig.w(24),
            controller: TextEditingController(),
          ),
        ),

        SizedBox(height: SizeConfig.h(15)),

        // 🔴 النص التحذيري
        Text(
          "**برجاء تحري الدقة وحفظ البيانات قبل الحفظ",
          style: AppTextStyles.styleSemiBold13(
            context,
          ).copyWith(color: const Color(0xffC0303A)),
          textAlign: TextAlign.right,
        ),

        SizedBox(height: SizeConfig.h(25)),

        // 🔘 الأزرار
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kprimarycolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.w(10)),
                ),
                padding: EdgeInsets.symmetric(vertical: SizeConfig.h(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save, color: Colors.white, size: SizeConfig.w(18)),
                  SizedBox(width: SizeConfig.w(4)),
                  Text(
                    "حفظ التغييرات",
                    style: AppTextStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
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
