import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/otp.dart';
import 'package:plupool/core/utils/size_config.dart';

class VerificationBody extends StatefulWidget {
  final String phoneNumber;
  final String btntext;
  final void Function(String otpCode) onVerify;

  const VerificationBody({
    super.key,
    required this.phoneNumber,
    required this.btntext,
    required this.onVerify,
  });

  @override
  State<VerificationBody> createState() => _VerificationBodyState();
}

class _VerificationBodyState extends State<VerificationBody> {
  int secondsRemaining = 30;
  bool canResend = false;
  Timer? timer;
  String otpCode = '';

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    setState(() {
      canResend = false;
      secondsRemaining = 30;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining > 0) {
        setState(() => secondsRemaining--);
      } else {
        setState(() => canResend = true);
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String get maskedNumber {
    if (widget.phoneNumber.length >= 4) {
      final last4 = widget.phoneNumber.substring(widget.phoneNumber.length - 4);
      return "****$last4";
    }
    return widget.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Text(
          'تحقق من رقمك',
          style: AppTextStyles.styleSemiBold16(context).copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 8),
        Text(
          'بعتنالك رمز مكون من 5 أرقام على رقمك المنتهي بـ $maskedNumber',
          style: AppTextStyles.styleRegular14(context).copyWith(color: const Color(0xff808080)),
        ),
        SizedBox(height: SizeConfig.h(37)),

        // 🔢 إدخال الكود
        Otp(
          onCompleted: (code) {
            setState(() => otpCode = code);
          },
        ),

        SizedBox(height: SizeConfig.h(39)),

        // 🔁 إعادة الإرسال
        AuthSwitchRow(
          leadingText: 'ما استلمتش الرمز؟ ',
          actionText: canResend
              ? 'إعادة الإرسال'
              : 'خلال ${secondsRemaining.toString().padLeft(2, '0')} ثانية',
          onTap: canResend ? _startCountdown : null,
        ),
        SizedBox(height: SizeConfig.h(36)),

        // 🔘 زر إنشاء الحساب بعد التحقق
        CustomTextBtn(
          width: double.infinity,
          text: widget.btntext,
          onPressed: () {
            if (otpCode.length < 5) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('أدخل رمز التحقق بالكامل')),
              );
              return;
            }
            widget.onVerify(otpCode); // 🔹 نرسل الكود للتحقق
          },
        ),
      ],
    );
  }
}
