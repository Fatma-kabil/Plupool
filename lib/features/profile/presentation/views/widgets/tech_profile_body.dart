import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_option.dart';

class TechProfileBody extends StatelessWidget {
  const TechProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          ProfileOption(
            title: 'معلومات الحساب',
            icon: Icons.person_outline,
            onTap: () {
               context.push('/profiledetailsview');
            },
          ),
           SizedBox(height:SizeConfig.isWideScreen? SizeConfig.h(35):SizeConfig.h(8)),

          ProfileOption(
            title: 'الإعدادات',
            icon: Icons.settings_outlined,
            onTap: () {},
          ),
           SizedBox(height:SizeConfig.isWideScreen? SizeConfig.h(35):SizeConfig.h(8)),
          ProfileOption(
            title: 'مركز المساعدة',
            icon: Icons.help_outline,
            onTap: () {},
          ),
           SizedBox(height:SizeConfig.isWideScreen? SizeConfig.h(35):SizeConfig.h(8)),
          ProfileOption(
            title: 'الخصوصية والأمان',
            icon: Icons.lock_outline,
            onTap: () {},
          ),
          SizedBox(height:SizeConfig.isWideScreen? SizeConfig.h(35):SizeConfig.h(8)),

          ProfileOption(
            title: 'لماذا نحن؟',
            icon: Icons.info_outline,
            onTap: () {},
          ),
         SizedBox(height:SizeConfig.isWideScreen? SizeConfig.h(35):SizeConfig.h(8)),

          ProfileOption(
            title: 'تسجيل الخروج',
            icon: Icons.logout,
            islogout: true,
            onTap: () {},
          ),
        
        ],
      ),
    );
  }
}
