import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/presentation/views/user/widgets/mood_control_design.dart';
import 'package:plupool/features/services/presentation/views/user/widgets/service_card.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(top:SizeConfig.h(60) , left:SizeConfig.w(16) , right: SizeConfig.h(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اختر الخدمة المناسبة لك',
              style: AppTextStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
             SizedBox(height:SizeConfig.h(28) ),

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

             SizedBox(height: SizeConfig.h(55)),

            // ====== صيانة حمام سباحة ======
            ServiceCard(
              title: "صيانة حمام سباحة",
              description: "صيانة دورية أو عاجلة لحمامك للحفاظ على أدائه",
              iconPath: 'assets/icons/proocardicon3.svg',
              buttonText: "اطلب صيانة",
              onPressed: () {
                context.push('/maintenanceserviceview');
              
              },
            ),

             SizedBox(height: SizeConfig.h(63)),
            const MoodControlsDesign(),
             SizedBox(height: SizeConfig.h(70)),
          ],
        ),
      ),
    );
  }
}
