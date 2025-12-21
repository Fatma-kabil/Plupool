import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'drawer_badge.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int? badgeCount;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.badgeCount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = const Color(0xff0077B6);
    final inactiveColor = Color(0xffBBBBBB);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(8),
            vertical: SizeConfig.h(2),
          ),
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(12)),

          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              icon,
              color: isSelected ? activeColor : inactiveColor,
              size: SizeConfig.w(24),
            ),
            title: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: isSelected
                  ? AppTextStyles.styleBold16(context).copyWith(fontFamily: 'Cairo')
                  : AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(color: Color(0xff7B7B7B),fontFamily: 'Cairo'),
              child: Text(title),
            ),
            trailing: badgeCount != null
                ? DrawerBadge(count: badgeCount!)
                : null,
          ),
        ),
      ),
    );
  }
}
