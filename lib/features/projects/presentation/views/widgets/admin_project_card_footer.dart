import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class AdminProjectCardFooter extends StatelessWidget {
  const AdminProjectCardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(6),
            vertical: SizeConfig.h(4),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.kprimarycolor,
          ),

          child: Icon(Icons.add, color: Colors.white, size: SizeConfig.w(18)),
        ),
        SizedBox(width: SizeConfig.w(8)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(6),
            vertical: SizeConfig.h(4),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.kprimarycolor,
          ),

          child: Icon(
            Icons.remove,
            color: Color(0xffD4D4D4),
            size: SizeConfig.w(18),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
           context.push('/editprojectview');
          },
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(6)),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffCCF0F7),
            ),
            child: Icon(
              Icons.edit_note_outlined,
              color: AppColors.kprimarycolor,
              size: SizeConfig.w(20),
            ),
          ),
        ),
        SizedBox(width: SizeConfig.w(12)),
        Container(
          padding: EdgeInsets.all(SizeConfig.w(6)),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFAD7DA),
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            color: Color(0xffE63946),
            size: SizeConfig.w(20),
          ),
        ),
      ],
    );
  }
}
