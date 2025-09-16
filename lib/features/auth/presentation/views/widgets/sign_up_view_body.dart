import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_form_field.dart';
// استدعاء الكاستم

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool acceptedTerms = false; // حالة checkbox

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AuthHeader(
            title: "أنشئ ملفك الشخصي الآن",
            subtitle: "أدخل بياناتك حتي تستفيد بكل الخدمات",
          ),
          SizedBox(height: 20),
          Text(
            'رقم الهاتف',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: Colors.black),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          CustomTextFormField(hintText: 'أدخل رقم الهاتف', icon: Icons.phone),
          SizedBox(height: 20),
          Text(
            '*الرقم لن يكون مرئيا للمستخدمين الاخرين في التطبيق',
            style: AppTextStyles.styleRegular10(context),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 18),

          // ✅ إضافة الكاستم Checkbox
          CustomCheckbox(
            value: acceptedTerms,
            onChanged: (val) {
              setState(() {
                acceptedTerms = val;
              });
            },
            label: 'الموافقة علي  الشروط والأحكام وسياسة الخصوصية',
           
          ),
        ],
      ),
    );
  }
}
