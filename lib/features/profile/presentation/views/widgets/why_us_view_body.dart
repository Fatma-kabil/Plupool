import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/metric_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/why_us_card.dart';

class WhyUsViewBody extends StatelessWidget {
  const WhyUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "لماذا تختار Plupool؟",
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(10)),
          Text(
            "شريكك الموثوق للتصميم الذكي، البناء، والصيانة الاحترافية لحمامات السباحة",
            style: AppTextStyles.styleRegular16(
              context,
            ).copyWith(color: Color(0xff777777)),
          ),
          SizedBox(height: SizeConfig.h(25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: MetricCard(
                  icon: "assets/icons/Rating.svg", // تقييم
                  value: "4.8",
                  label: 'التقييم',
                ),
              ),

              SizedBox(width: SizeConfig.w(8)),

              Expanded(
                flex: 1,
                child: MetricCard(
                  icon: "assets/icons/shield.svg", // منتج/صندوق
                  value: "10+",
                  label: 'سنوات خبرة',
                ),
              ),

              SizedBox(width: SizeConfig.w(8)),
              Expanded(
                flex: 1,
                child: MetricCard(
                  icon: "assets/icons/tasks.svg", // شحن/توصيل
                  value: "500+",
                  label: 'مشروع منجز',
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(40)),
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
      ),
    );
  }
}
