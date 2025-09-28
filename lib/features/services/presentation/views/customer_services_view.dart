import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/services/presentation/views/widgets/coming_soon_card.dart';
import 'package:plupool/features/services/presentation/views/widgets/service_card.dart';

class CustomerServicesView extends StatelessWidget {
  const CustomerServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'اختر الخدمة المناسبة لك',
              style: AppTextStyles.styleBold20(context)
                  .copyWith(color: AppColors.ktextcolor),
            ),
            const SizedBox(height: 28),
        
            ServiceCard(
              title: "إنشاء حمامات سباحة",
              description: "ابدأ بتصميم وإنشاء حمام سباحة جديد يناسب احتياجاتك",
              iconPath: 'assets/icons/pool-ladder.svg',
              buttonText: "ابدأ الآن", // 👈 النص اللي هيظهر في الباتون
              onPressed: () {
                print("إنشاء حمامات سباحة");
              },
            ),
        
            const SizedBox(height: 55),
        
            ServiceCard(
              title: " صيانة حمام سباحة ",
              description: "صيانة دورية أو عاجلة لحمامك للحفاظ على أدائه",
              iconPath: 'assets/icons/proocardicon3.svg',
              buttonText: "اطلب صيانة ", // 👈 هنا نص مختلف
              onPressed: () {
                print("صيانة حمامات سباحة");
              },
            ),
                const SizedBox(height: 63),
                ComingSoonCard(),
                 const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
