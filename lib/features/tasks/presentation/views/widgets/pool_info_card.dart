import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PoolInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color iconcolor;
  final IconData icon;

  const PoolInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon, required this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
   //   textDirection: TextDirection.rtl,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.28,
          padding:  EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: iconcolor, width: 1.5),
                  borderRadius: BorderRadius.circular(150),
                ),
                child: Padding(padding: EdgeInsets.all(SizeConfig.w(8)),
                child: Icon(icon, color: iconcolor, size: SizeConfig.w(20)),
              ),),
              SizedBox(height: SizeConfig.h(5)),
              Text(title,style: AppTextStyles.styleRegular13(context).copyWith(color: Color(0xFF777777)),),
           //   SizedBox(height: SizeConfig.h(4)),
              Text(
                 textDirection: TextDirection.rtl,
                value, textAlign: TextAlign.center,style: AppTextStyles.styleSemiBold13(context).copyWith(color: Color(0xff555555)),),
            ],
          ),
        ),
      ],
    );
  }
}
