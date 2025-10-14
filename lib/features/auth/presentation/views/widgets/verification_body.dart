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

  const VerificationBody({super.key, required this.phoneNumber});

  @override
  State<VerificationBody> createState() => _VerificationBodyState();
}

class _VerificationBodyState extends State<VerificationBody> {
  int secondsRemaining = 30;
  bool canResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startCountdown(); // ✅ يبدأ العد التنازلي فور فتح الشاشة
  }

  void _startCountdown() {
    setState(() {
      canResend = false;
      secondsRemaining = 30;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          canResend = true;
        });
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
        // 🧭 العنوان
        Text(
          'تحقق من رقمك',
          style: AppTextStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 8),
        Text(
          'بعتنالك رمز مكون من 5 أرقام على رقمك المنتهي بـ $maskedNumber',
          style: AppTextStyles.styleRegular14(context)
              .copyWith(color: const Color(0xff808080)),
        ),
    
        SizedBox(height: SizeConfig.h(37)),
    
        // 🔢 إدخال الكود
        const Otp(),
    
        SizedBox(height: SizeConfig.h(39)),
    
        // 🔁 إعادة الإرسال (تتغير حسب الحالة)
        AuthSwitchRow(
          leadingText: 'ما استلمتش الرمز؟ ',
          actionText: canResend
              ? 'إعادة الإرسال'
              : 'خلال ${secondsRemaining.toString().padLeft(2, '0')} ثانية',
          onTap: canResend
              ? () {
                  debugPrint('🔁 إعادة إرسال الكود إلى ${widget.phoneNumber}');
                  _startCountdown(); // 🔄 يبدأ العدّ من جديد بعد الإرسال
                }
              : null,
        ),
    
        SizedBox(height: SizeConfig.h(36)),
    
        // 🔘 زر تسجيل الدخول
        CustomTextBtn(
          width: double.infinity,
          text: 'تسجيل الدخول',
          onPressed: () {
       //     context.push('/success'); // أو أي Route خاص بالتحقق
          },
        ),
      ],
    );
  }
}
