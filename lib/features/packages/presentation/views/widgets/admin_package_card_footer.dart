import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class AdminPackageCardFooter extends StatelessWidget {
  const AdminPackageCardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(4),
            vertical: SizeConfig.h(2),
          ),
          color: AppColors.kprimarycolor,
          child: Icon(Icons.add, color: Colors.white, size: SizeConfig.w(15)),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(4),
            vertical: SizeConfig.h(2),
          ),
          color: AppColors.kprimarycolor,
          child: Icon(
            Icons.minimize_outlined,
            color: Color(0xffD4D4D4),
            size: SizeConfig.w(15),
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(SizeConfig.w(6)),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFAD7DA),
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            color: Color(0xffE63946),
            size: SizeConfig.w(15),
          ),
        ),
        SizedBox(width: SizeConfig.w(6)),
        Container(
          padding: EdgeInsets.all(SizeConfig.w(6)),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffCCF0F7),
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            color: AppColors.kprimarycolor,
            size: SizeConfig.w(15),
          ),
        ),
      ],
    );
  }
}
