import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_option.dart';

class AdminSettingViewBody extends StatelessWidget {
  const AdminSettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
      

        ProfileOption(
          title: 'مركز المساعدة',
          icon: Icons.help_outline,
          onTap: () {
       //     context.push('/helpview', extra: 'صاحب حمام سباحه');
          },
        ),
        SizedBox(
          height: SizeConfig.isWideScreen ? SizeConfig.h(45) : SizeConfig.h(12),
        ),
        ProfileOption(
          title: 'الخصوصية والأمان',
          icon: Icons.lock_outline,
          onTap: () {
       //     context.push('/privacyview');
          },
        ),
        SizedBox(
          height: SizeConfig.isWideScreen ? SizeConfig.h(45) : SizeConfig.h(12),
        ),

        ProfileOption(
          title: 'لماذا نحن؟',
          icon: Icons.info_outline,
          onTap: () {
        //    context.push('/whyusview', extra: 'صاحب حمام سباحه');
          },
        ),
      
      ],
    );
  }
}
