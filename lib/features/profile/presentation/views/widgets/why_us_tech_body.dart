
import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/why_us_card.dart';

class WhyUsTechBody extends StatelessWidget {
  const WhyUsTechBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhyUsCard(
          icon: Icons.calendar_month,
          backColor: Color(0xffCDF7EC),
          iconColor: Color(0xff06D6A0),
          title: "تنظيم المهام الأسبوعية",
          subtitle:
              "يوفر لك دخول لعمل منظم يساعدك على متابعة مهامك بكفاءة وتلبية احتياجات العملاء في الوقت المحدد.",
        ),
         SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon:Icons.show_chart,
          backColor: Color(0xffCCF0F7),
          iconColor: Color(0xff0096B4),
          title: "تقارير أداء شهرية",
          subtitle:
              "تحصل على تقارير شهرية مفصلة عن أدائك تساعدك على تحسين جودة خدماتك وزيادة دخلك.",
        ),
                   SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon:Icons.headset_mic,
          backColor: Color(0xffFFECD2),
          iconColor: Color(0xffFF9F1C),
          title: "دعم فني مستمر",
          subtitle:
             "فريق دعم فني متاح على مدار الساعة لمساعدتك في أي استفسارات أو مشاكل تقنية تواجهها.",
        ),
      ],
    );
  }
}
