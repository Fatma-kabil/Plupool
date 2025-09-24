 import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/build_nav_icon.dart';

BottomNavigationBarItem buildNavItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 6, left: 8, right: 8),
        child: buildNavIcon(icon, color: const Color(0xffBBBBBB)),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 6, left: 8, right: 8),
        child: buildNavIcon(icon, color: AppColors.kprimarycolor),
      ),
      label: label,
    );
  }