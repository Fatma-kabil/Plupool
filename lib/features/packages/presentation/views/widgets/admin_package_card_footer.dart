import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';

class AdminPackageCardFooter extends StatelessWidget {
  const AdminPackageCardFooter({super.key,required this.model});
  final UserBookingEntity model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
       
        GestureDetector(
          onTap: () {
            context.push('/editpackageview',extra: model);
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
              size:SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(20),
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
            size:SizeConfig.isWideScreen ? SizeConfig.w(15) : SizeConfig.w(20),
          ),
        ),
      ],
    );
  }
}
