import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/info_col.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/section_header.dart';

class CustomerInfoCard extends StatelessWidget {
  const CustomerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          SectionHeader(icon: Icons.person, title: "تفاصيل العميل"),
          SizedBox(height: SizeConfig.h(12)),
          const InfoCol(label: "اسم العميل:", value: "محمد عبد الرحمن"),
          SizedBox(height: SizeConfig.h(12)),
          const InfoCol(
            label: "العنوان:",
            value: "٢٨٧ شارع النخيل، الإسكندرية، مصر",
          ),
          SizedBox(height: SizeConfig.h(10)),
          GestureDetector(
            onTap: () {
              // TODO: Open map
            },
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                  size: SizeConfig.w(20),
                ),
                SizedBox(width: SizeConfig.w(2)),
                Text(
                  "عرض على الخريطة",
                  style: AppTextStyles.styleSemiBold13(context).copyWith(
                    color: AppColors.kprimarycolor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
