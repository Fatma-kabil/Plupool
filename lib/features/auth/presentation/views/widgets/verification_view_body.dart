import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/otp.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthHeader(
          title: 'تحقق من رقمك',
          subtitle:
              'بعتنالك رمز مكون من 5 أرقام على رقمك المنتهي بـ \n****1234',
        ),
        SizedBox(height: 36),
        Otp(),
        SizedBox(height: 107),
        CustomTextBtn(text: 'تأكيد', onPressed: () {}),
        SizedBox(height: 48),
        AuthSwitchRow(leadingText: 'ما استلمتش الرمز؟ أعد الإرسال خلال ', actionText: 'خلال 30 ثانية', onTap: () {}),
      ],
    );
  }
}
