import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/why_us_card.dart';

class WhyUsOwnerBody extends StatelessWidget {
  const WhyUsOwnerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhyUsCard(
          icon: Icons.group,
          backColor: Color(0xffCDF7EC),
          iconColor: Color(0xff05B285),
          title: "فريق هندسي متخصص",
          subtitle:
              "أكثر من ١٠ سنوات من الخبرة في تصميم وبناء حمامات السباحة بدقة واحترافية عالية.",
        ),
        SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon: Icons.view_in_ar,
          backColor: Color(0xffCCF0F7),
          iconColor: Color(0xff0096B4),
          title: "محاكاة ثلاثية الأبعاد",
          subtitle:
              "تصور حمام السباحة الخاص بك قبل البناء من خلال معاينة تفاعلية ثلاثية الأبعاد.",
        ),
        SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon: Icons.build,
          backColor: Color(0xffFFECD2),
          iconColor: Color(0xffFF9F1C),
          title: "صيانة ذكية",
          subtitle:
              "تتبع حالة حمام السباحة، جدولة الزيارات، والحصول على تحديثات فورية عبر التطبيق.",
        ),
         SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon: Icons.verified,
          backColor: Color(0xffF6C3E4),
          iconColor: Color(0xffD759BB),
          title: "فنيون معتمدون",
          subtitle:
             "يتم تقييم ومراقبة كل فني لضمان تقديم خدمة عالية الجودة.",
        ),
                 SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon: Icons.visibility_outlined,
          backColor: Color(0xffFAD7DA),
          iconColor: Color(0xffEA5A65),
          title: "شفافية كاملة",
          subtitle:
            "اطلع على كل خدمة، سجل الزيارات، وتقارير الفنيين مباشرة من لوحة التحكم الخاصة بك.",
        ),
      ],
    );
  }
}
