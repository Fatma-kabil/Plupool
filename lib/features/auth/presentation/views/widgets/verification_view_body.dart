import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/otp.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(left: 22,right: 22,bottom: 22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              title: 'تحقق من رقمك',
              subtitle:
                  'بعتنالك رمز مكون من 5 أرقام على رقمك المنتهي بـ \n****1234',
            ),
            SizedBox(height: 36),
            Otp(),
            SizedBox(height: 107),
            CustomTextBtn(
              width: double.infinity,
              text: 'تأكيد',
              onPressed: () {
                context.push('/success');
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
