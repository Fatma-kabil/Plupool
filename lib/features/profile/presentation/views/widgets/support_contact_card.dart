import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_field.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';

class SupportContactCard extends StatelessWidget {
  const SupportContactCard({
    super.key,
    required this.formKey,
    required this.onSend,
    required this.notesController,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onSend;
  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(15),
        horizontal: SizeConfig.w(12),
      ),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),

      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "تواصل مع الدعم",
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),

            SizedBox(height: SizeConfig.h(15)),
            NoteField(
              controller: notesController,
              //   onChanged: (_) {},
            ),

            SizedBox(height: SizeConfig.h(25)),

            Directionality(
              textDirection: TextDirection.ltr,
              child: EditButton(
                tittle: "إرسال",
                icon: Icons.send_rounded,
              
                onPressed: onSend,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
