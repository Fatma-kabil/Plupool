import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PreviousValuesSection extends StatelessWidget {
  const PreviousValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.w(10)),
      decoration: BoxDecoration(
        color: const Color(0xffCCE4F0),
        border: Border.all(color: AppColors.kprimarycolor),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
               Icon(Icons.refresh, color: AppColors.kprimarycolor,size: SizeConfig.w(18),),
               Text(
                "القيم السابقة",
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
             
            ],
          ),
          SizedBox(height: SizeConfig.h(12)),
          Column(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              _ValueItem(label: "درجة الحرارة", value: "25°c", icon: Icons.thermostat, iconColor: Color(0xffF48C06)),
               SizedBox(height:SizeConfig.w(4) ),
              _ValueItem(label: "مستوى الكلور", value: "2.5 ppm", icon: Icons.science, iconColor: Color(0xff00B4D8)),
               SizedBox(height:SizeConfig.w(4) ),
              _ValueItem(label: "مستوى الحموضة", value: "7.2", icon: Icons.water_drop, iconColor: Color(0xff0077B6)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ValueItem extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color iconColor;

  const _ValueItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(icon, color: iconColor, size:SizeConfig.w(18) ),
       SizedBox(height:SizeConfig.w(4) ),
        Text(label, style:AppTextStyles.styleRegular14(context).copyWith(color: Color(0xff777777))),
        Spacer(),
        Text(value, style: AppTextStyles.styleBold16(context).copyWith(color: Color(0xff555555))),
      ],
    );
  }
}
