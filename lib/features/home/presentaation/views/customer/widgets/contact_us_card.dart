import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/done_contact_us_card.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_field.dart';

class ContactUsCard extends StatefulWidget {
  const ContactUsCard({super.key});

  @override
  State<ContactUsCard> createState() => _ContactUsCardState();
}

class _ContactUsCardState extends State<ContactUsCard> {
  bool _isSubmitted = false;
  final _formKey = GlobalKey<FormState>(); // ✅ مفتاح للفورم
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return _isSubmitted
        ? const DoneContactUsCard()
        : Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.w(16),
              right: SizeConfig.w(16),
              top: SizeConfig.h(44),
              bottom: SizeConfig.h(50),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🟢 العنوان
                    Text(
                      "تواصل معنا لإدارة وصيانة حمام السباحة",
                      style: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    // 🟢 الوصف
                    Text(
                      "اختر نوع الخدمة وأخبرنا بملاحظاتك لنخدمك بشكل أفضل",
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 14),

                    // 🟢 عنوان فرعي
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "الملاحظات",
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                    ),

                    const SizedBox(height: 8),
                    // 🟢 TextField مع أيقونة مرفقات في الأسفل يسار
                    NoteField(controller: _noteController),

                    const SizedBox(height: 40),

                    // 🟢 زر الإرسال
                    CustomTextBtn(
                      width: double.infinity,
                      text: 'إرسال',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isSubmitted = true;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
