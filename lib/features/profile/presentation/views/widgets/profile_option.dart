import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool islogout;

  const ProfileOption({
    required this.title,
    required this.icon,
    required this.onTap,
    this.islogout = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          icon,
          color:islogout?Colors.red: AppColors.kprimarycolor,
          size:SizeConfig.isWideScreen? SizeConfig.h(23): SizeConfig.w(19),
        ),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: AppTextStyles.styleMedium16(
            context,
          ).copyWith(color:islogout?Colors.red: Color(0xff777777)),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color:islogout?Colors.red: Color(0xffA4A4A4),
          size: SizeConfig.w(20),
        ),
        onTap: onTap,
      ),
    );
  }
}
