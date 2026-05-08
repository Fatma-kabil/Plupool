import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_view_header_card.dart';

class TechViewBodyCardHeader extends StatelessWidget {
  const TechViewBodyCardHeader({super.key,required this.rate,required this.activeTech,required this.inActiveTech});
  final double rate;
  final int activeTech;
  final int inActiveTech;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: ProjectViewHeaderCard(
            icon:Icons.star, // تقييم
            value: toArabicNumbers(rate.toString()),
            label: 'متوسط التقييم',
            bkColor: Color(0xffFFECD2),
            iconColor: Color(0xffFF9F1C),
          ),
        ),

        SizedBox(width: SizeConfig.w(5)),

        Expanded(
          flex: 1,
          child: ProjectViewHeaderCard(
            icon: Icons.group, // تقييم
            value:toArabicNumbers(activeTech.toString()),
            label: 'فني نشط',
            bkColor: Color(0xffCCF0F7),
            iconColor: Color(0xff00B4D8),
          ),
        ),

        SizedBox(width: SizeConfig.w(5)),
        Expanded(
          flex: 1,
          child: ProjectViewHeaderCard(
            icon: Icons.group_off, // تقييم
            value:toArabicNumbers(inActiveTech.toString()) ,
            label: 'فني موقوف',
            bkColor: Color(0xffCDF7EC),
            iconColor: Color(0xff05B285),
          ),
        ),
      ],
    );
  }
}