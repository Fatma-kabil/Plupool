import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/services/presentation/views/widgets/mood_control_design.dart';
import 'package:plupool/features/services/presentation/views/widgets/service_card.dart';


class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'اختر الخدمة المناسبة لك',
              style: AppTextStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            const SizedBox(height: 28),

            // ====== إنشاء حمامات سباحة ======
            ServiceCard(
              title: "إنشاء حمامات سباحة",
              description: "ابدأ بتصميم وإنشاء حمام سباحة جديد يناسب احتياجاتك",
              iconPath: 'assets/icons/pool-ladder.svg',
              buttonText: "ابدأ الآن",
              onPressed: () {
                context.push('/constructionservicesview');
              },
            ),

            const SizedBox(height: 55),

            // ====== صيانة حمام سباحة ======
            ServiceCard(
              title: "صيانة حمام سباحة",
              description: "صيانة دورية أو عاجلة لحمامك للحفاظ على أدائه",
              iconPath: 'assets/icons/proocardicon3.svg',
              buttonText: "اطلب صيانة",
              onPressed: () {
                print("صيانة حمامات سباحة");
              },
            ),

            const SizedBox(height: 63),
            const MoodControlsDesign(),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
