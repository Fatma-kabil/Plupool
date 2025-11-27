import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/faq_section.dart';

class HelpViewBody extends StatelessWidget {
  const HelpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الأسئلة الشائعة",
            style: AppTextStyles.styleBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(20),),
          FaqSection(),
           SizedBox(height: SizeConfig.h(40),),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: SizeConfig.h(15),
              bottom: SizeConfig.h(15),
              right: SizeConfig.w(12),

              left: SizeConfig.w(12),
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تواصل مع الدعم",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
