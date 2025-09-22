import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/divider_with_text.dart';
import 'package:plupool/features/auth/presentation/views/widgets/google_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/login_form.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              title: 'يلا نسجل دخولك',
              subtitle: 'أدخل بياناتك للوصول لحسابك',
            ),
            LoginForm(),
            SizedBox(height: 13),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push('/forgetpassword');
                  },
                  child: Text(
                    ' نسيت كلمة المرور  ',
                    style: AppTextStyles.styleSemiBold14(context).copyWith(
                      decoration: TextDecoration.underline,
                      color: Color(0xff777777),
                    ),
                  ),
                ),
                Spacer(),
                CustomCheckbox(
                  value: acceptedTerms,
                  onChanged: (val) {
                    setState(() {
                      acceptedTerms = val;
                    });
                  },
                  label: 'تذكرني',
                ),
              ],
            ),
            SizedBox(height: 59),
            CustomTextBtn(
              text: ' تسجيل الدخول ',
              onPressed: () {
                // إضافة وظيفة الزر هنا
                //     context.push('/verification');
              },
            ),
            SizedBox(height: 58),
            DividerWithText(text: 'تسجيل الدخول عن طريق'),
            SizedBox(height: 40),
            GoogleBtn(
              onTap: () {
                //   context.push('/verification');
              },
            ),
            SizedBox(height: 66),

            AuthSwitchRow(
              leadingText: ' ليس لدي حساب ',
              actionText: ' انشاء حساب',
              onTap: () {
                context.go('/selectrole');
              },
            ),
            SizedBox(height: 104),
          ],
        ),
      ),
    );
  }
}
