import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/guarantee_card.dart';

class GuaranteesSection extends StatelessWidget {
  const GuaranteesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ضماناتنا المميزة",
          style: AppTextStyles.styleSemiBold20(
            context,
          ).copyWith(color: Colors.black),
        ),
        const SizedBox(height: 16),

        // 👇 الكروت
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GuaranteeCard(
                imagecolor: Color(0xff05B285),
                image: 'assets/icons/shield.svg',

                title: "ضمان 10 سنوات",
                description: "ضمان شامل لأي مشاكل متعلقة بالإنشاء",

                backgroundColor: Color(0xffCDF7EC), // أزرق فاتح
              ),
            ),
            SizedBox(width: SizeConfig.w(8)),
            Expanded(
              child: GuaranteeCard(
                imagecolor: Color(0xffFF9F1C),
                image: 'assets/icons/services.svg',
                title: "صيانة مجانية 3 شهور",
                description: "فترة صيانة مجانية بعد الإنشاء مباشرة",
                backgroundColor: Color(0xffFFECD2), // برتقالي فاتح
              ),
            ),
            SizedBox(width: SizeConfig.w(8)),
            Expanded(
              child: GuaranteeCard(
                imagecolor: Color(0xff00B4D8),
                title: "ضمان المعدات 3 سنوات",
                description: "ضمان على الطرمبات والمواتير مع عقد صيانة مستمر",
                image: 'assets/icons/mach_shield.svg',
                backgroundColor: Color(0xffCCF0F7), // أخضر فاتح
              ),
            ),
          ],
        ),
      ],
    );
  }
}
