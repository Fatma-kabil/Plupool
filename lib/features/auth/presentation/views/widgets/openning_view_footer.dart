import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_btn.dart';

class OpenningViewFooter extends StatelessWidget {
  const OpenningViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomTextBtn(text: "تسجيل الدخول", onPressed: () {

             context.push('/login');
          }),
          SizedBox(height: SizeConfig.h(35)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push('/selectrole');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // ✅ صححت هنا
                  side: BorderSide(color: AppColors.kprimarycolor, width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  " إنشاء حساب جديد",
                  style: AppTextStyles.styleSemiBold20(
                    context,
                  ).copyWith(color: AppColors.kprimarycolor),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.h(40)),
          GestureDetector(
            onTap: () {},
            child: Text(
              "الاستمرار كضيف",
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
