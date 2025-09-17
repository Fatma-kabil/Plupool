import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/divider_with_text.dart';
import 'package:plupool/features/auth/presentation/views/widgets/google_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';
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
      child: SingleChildScrollView(
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
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: Colors.black),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            PhoneInputField(),
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
              label: 'الموافقة علي الشروط والأحكام وسياسة الخصوصية',
            ),
            SizedBox(height: 68),
            CustomTextBtn(
              text: 'إرسال رمز التحقق',
              onPressed: () {
                // إضافة وظيفة الزر هنا
                context.push('/verification');
              },
            ),
            SizedBox(height: 38),
            DividerWithText(text: 'إنشاء حساب عن طريق'),
            SizedBox(height: 47),
            GoogleBtn(onTap: () {
              context.push('/verification');
            },),
            SizedBox(height: 42),
            GestureDetector(
              onTap: () {
                // إضافة وظيفة التبديل إلى تسجيل الدخول هنا
              },
              child: Center(
                child: Text(
                  'تخطي',
                  style: AppTextStyles.styleSemiBold16(context).copyWith(
                    decoration: TextDecoration.underline,
                    color: Color(0xff1A1A1A),
                  ),
                ),
              ),
            ),
            SizedBox(height: 37),

            AuthSwitchRow(
              leadingText: 'لدي حساب بالفعل',
              actionText: 'تسجيل الدخول',
              onTap: () {},
            ),
            // إضافة وظيفة التبديل إلى تسجيل الدخول هنا
          ],
        ),
      ),
    );
  }
}
