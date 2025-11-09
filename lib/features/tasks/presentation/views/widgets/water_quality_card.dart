import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class WaterQualityCard extends StatelessWidget {
  final String title;
  final String value;
  final String? idealRange;
  final IconData icon;
  final Color color;
  final Color backgroundcolor;

  const WaterQualityCard({
    super.key,
    required this.title,
    required this.value,
    this.idealRange,
    required this.icon,
    required this.color,
    required this.backgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular((SizeConfig.w(10))),
      ),
      child: Row(
        textDirection: TextDirection.rtl,

        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundcolor,
              borderRadius: BorderRadius.circular(SizeConfig.w(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.w(7)),
              child: Icon(icon, color: color, size: SizeConfig.w(20)),
            ),
          ),
          SizedBox(width: SizeConfig.w(6)),

          /// 🧾 النصوص (العنوان والمعدل المثالي)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),

                    /// 💧 القيمة + الأيقونة
                    Text(
                      value,
                      style: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(2)),
                if (idealRange != null && idealRange!.isNotEmpty)
                  Text(
                    textDirection: TextDirection.rtl,
                    "المعدل المثالي: $idealRange",
                    style: AppTextStyles.styleRegular14(
                      context,
                    ).copyWith(color: Color(0xff777777)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
