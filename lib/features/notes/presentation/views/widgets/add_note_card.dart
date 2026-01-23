import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_field.dart';

class AddNoteCard extends StatelessWidget {
  AddNoteCard({super.key});

  final _formKey = GlobalKey<FormState>(); // ✅ مفتاح للفورم
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Directionality(
  textDirection: TextDirection.rtl,
  child:  Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "اكتب ملاحظاتك أو أي تفاصيل إضافية تحب فريقنا يعرفها",
              style: AppTextStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff555555)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الملاحظات",
                style: AppTextStyles.styleSemiBold16(context),
              ),
            ),
            const SizedBox(height: 8),
            NoteField(controller: _noteController), // ✅ هيشتغل
            const SizedBox(height: 40),
            CustomTextBtn(
              width: double.infinity,
              text: 'حفظ',
              onPressed: () {},
            ),
          ],
        ),
      ),
    ),

);

  }
}
