import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    
    
    return   Padding(
  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(SizeConfig.isWideScreen ? 30 : 15)),
  child: Row(
    textDirection: TextDirection.rtl,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Baseline(
        baseline:SizeConfig.isWideScreen?39: 33, // 👈 جرّبي تزودي/تنقصي الرقم حسب حجم الخط
        baselineType: TextBaseline.alphabetic,
        child: Transform.scale(
          scale: 1.2,
          child: Checkbox(
           // activeColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Color(0xffDDDFDF), width: 2),
            ),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
        ),
      ),
      SizedBox(width: 8),
      Expanded(
        child: RichText(
          textDirection: TextDirection.rtl,
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black87),
            children: [
              TextSpan(
                text: "من خلال إنشاء حساب، فإنك توافق على ",
                style: AppTextStyles.styleMedium16(context)
                   
              ),
              TextSpan(
                text: "الشروط والأحكام",
                style: AppTextStyles.styleMedium16(context).copyWith(
               //   color: buttonColor,
                
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint("فتح الشروط والأحكام");
                  },
              ),
              TextSpan(
                text: " الخاصة بنا",
                style: AppTextStyles.styleMedium16(context)
                    
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);


  }
}
