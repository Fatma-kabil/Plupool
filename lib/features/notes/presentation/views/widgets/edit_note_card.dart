import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_field.dart';
import 'package:plupool/features/support/presentation/views/widgets/attachment_chip.dart';

// ignore: must_be_immutable
class EditNoteCard extends StatelessWidget {
  EditNoteCard({super.key, required this.noteController});

  final _formKey = GlobalKey<FormState>(); // ✅ مفتاح للفورم
  final TextEditingController noteController;
  bool notesfiles = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20),vertical: SizeConfig.h(25)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "الملاحظات",
                    style: AppTextStyles.styleSemiBold16(context),
                  ),
                ),
                const SizedBox(height: 8),
                NoteField(controller: noteController),
                SizedBox(height: 15),
                notesfiles
                    ? SizedBox(
                        height: SizeConfig.h(30),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return AttachmentChip(fileName: "file.txt");
                          },
                        ),
                      )
                    : Text(
                        'لا توجد',
                        style: AppTextStyles.styleRegular16(
                          context,
                        ).copyWith(color: Color(0xff777777)),
                      ),
        
                // ✅ هيشتغل
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
      ),
    );
  }
}
