import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/otp.dart';

class VerficationForgetPasswordViewBody extends StatelessWidget {
  const VerficationForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 22),
        child: Column(
          children: [
            AuthHeader(
              title: '  إعادة تعيين كلمة المرور ',
              subtitle:
                  'أدخل رمز التحقق المكون من 5 أرقام الذي أرسلناه لك عبر البريد الإلكتروني أو الرسائل القصيرة.',
            ),
            SizedBox(height: 53),
            Otp(),
            SizedBox(height: 107),
            CustomTextBtn(
           width: double.infinity,
              text: 'تأكيد',
              onPressed: () {
                context.push('/newpassword');
                // إضافة وظيفة الزر هنا
                //     context.push('/verification');
              },
            ),
            SizedBox(height: 48),
            AuthSwitchRow(
              leadingText: 'ما استلمتش الرمز؟ أعد الإرسال خلال ',
              actionText: 'خلال 30 ثانية',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
