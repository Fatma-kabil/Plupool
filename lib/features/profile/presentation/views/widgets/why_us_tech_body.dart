import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/why_us_card.dart';

class WhyUsTechBody extends StatelessWidget {
  const WhyUsTechBody({super.key});

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
              "نوفر لك جدول أعمال منظم يساعدك على إدارة وقتك بكفاءة وتلبية احتياجات العملاء في الوقت المحدد.",
        ),
        SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon: Icons.location_on_outlined,
          backColor: Color(0xffCCF0F7),
          iconColor: Color(0xff0096B4),
          title: " الوصول لموقع العميل",
          subtitle: "عرض موقع العميل والتنقل إليه بسهولة باستخدام الخرائط",
        ),
        SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon: Icons.notifications_none,
          backColor: Color(0xffFFECD2),
          iconColor: Color(0xffFF9F1C),
          title: "إشعارات فورية",
          subtitle: "استقبل إشعارات عند تعيين طلب جديد أو حدوث أي تحديث.",
        ),
        SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon: Icons.rate_review_rounded,
          backColor: Color(0xffF6C3E4),
          iconColor: Color(0xffD759BB),
          title: "إشعارات فورية",
          subtitle: "الاطلاع على تقييمات العملاء لتحسين الأداء.",
        ),
        SizedBox(height: SizeConfig.h(15)),
        WhyUsCard(
          icon: Icons.headphones_outlined,
          backColor: Color(0xffFAD7DA),
          iconColor: Color(0xffEA5A65),
          title: "دعم فني مستمر",
          subtitle:
              "فريق دعم فني متاح على مدار الساعة لمساعدتك في أي استفسارات أو مشاكل تقنية تواجهها.",
        ),
      ],
    );
  }
}
