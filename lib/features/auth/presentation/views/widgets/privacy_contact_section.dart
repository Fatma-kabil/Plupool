import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PrivacyContactSection extends StatelessWidget {
  const PrivacyContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(6),
        vertical: SizeConfig.h(13),
      ),
      decoration: BoxDecoration(
        //  color: const Color(0xffFAFAFA),
        border: Border.all(color: Color(0xffD4D4D4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            textDirection: TextDirection.rtl,
            "📩 التواصل",
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.kprimarycolor),
          ),
          SizedBox(height: 10),
          Text(
            textDirection: TextDirection.rtl,
            "للاستفسارات أو الشكاوى المتعلقة بسياسة الخصوصية أو شروط الاستخدام، يرجى التواصل معنا عبر:",
            textAlign: TextAlign.right,
            style: AppTextStyles.styleRegular13(
              context,
            ).copyWith(color: Colors.grey[700]),
          ),
              SizedBox(height: 6),
          RichText(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            text: TextSpan(
              style: AppTextStyles.styleRegular13(context).copyWith(
                color: Colors.grey[700],
                fontFamily: 'Cairo', // 👈 ثبّت الخط هنا
              ),
              children: [
                TextSpan(
                  text: "البريد الإلكتروني: ",
                  style: AppTextStyles.styleBold13(context).copyWith(
                    color: Colors.black, // 👈 بولد أسود
                    fontFamily: 'Cairo',
                  ),
                ),
                TextSpan(
                  text: "support@plupool.com\n",
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Colors.grey[800], fontFamily: 'Cairo'),
                ),
                TextSpan(
                  text: "الهاتف: ",
                  style: AppTextStyles.styleBold13(
                    context,
                  ).copyWith(color: Colors.black, fontFamily: 'Cairo'),
                ),
                TextSpan(
                  text: "\u202A+20 123 456 7890\u202C\n", // رقم من الشمال
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Colors.grey[800], fontFamily: 'Cairo'),
                ),
                TextSpan(
                  text: "العنوان: ",
                  style: AppTextStyles.styleBold13(
                    context,
                  ).copyWith(color: Colors.black, fontFamily: 'Cairo'),
                ),
                TextSpan(
                  text: "القاهرة، مصر\n",
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Colors.grey[800], fontFamily: 'Cairo'),
                ),
                
                TextSpan(
                  text:
                      "نحن نعمل على الرد على جميع الاستفسارات خلال 48 ساعة عمل.",
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Colors.grey[700], fontFamily: 'Cairo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
