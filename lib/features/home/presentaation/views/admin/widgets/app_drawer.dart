import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'drawer_item.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int selectedIndex = 0;

  void _onItemTap(int index, VoidCallback action) {
    setState(() => selectedIndex = index);
    action();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kScaffoldColor,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
        child: Column(
          children: [
           
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerItem(
                    icon: Icons.home_outlined,
                    title: 'الرئيسية',
                    isSelected: selectedIndex == 0,
                    onTap: () => _onItemTap(0, () {}),
                  ),
                  DrawerItem(
                    icon: Icons.layers_outlined,
                    title: 'الباقات',
                    isSelected: selectedIndex == 1,
                    onTap: () => _onItemTap(1, () {}),
                  ),
                  DrawerItem(
                    icon: Icons.list_alt_outlined,
                    title: 'الخدمات المطلوبة',
                    isSelected: selectedIndex == 2,
                    onTap: () => _onItemTap(2, () {}),
                  ),
                  DrawerItem(
                    icon: Icons.notifications_none,
                    title: 'الإشعارات',
                    badgeCount: 8,
                    isSelected: selectedIndex == 3,
                    onTap: () => _onItemTap(3, () {}),
                  ),
                  DrawerItem(
                    icon: Icons.people_outline,
                    title: 'العملاء',
                    isSelected: selectedIndex == 4,
                    onTap: () => _onItemTap(4, () {}),
                  ),
                  DrawerItem(
                    icon: Icons.engineering_outlined,
                    title: 'الفنيين',
                    isSelected: selectedIndex == 5,
                    onTap: () => _onItemTap(5, () {}),
                  ),
                  DrawerItem(
                    icon: Icons.flag_outlined,
                    title: 'البلاغات',
                    badgeCount: 5,
                    isSelected: selectedIndex == 6,
                    onTap: () => _onItemTap(6, () {}),
                  ),
                  DrawerItem(
                    icon: Icons.chat_outlined,
                    title: 'رسائل تواصل معنا',
                    badgeCount: 10,
                    isSelected: selectedIndex == 7,
                    onTap: () => _onItemTap(7, () {}),
                  ),
                  DrawerItem(
                    icon: Icons.settings_outlined,
                    title: 'الإعدادات',
                    isSelected: selectedIndex == 8,
                    onTap: () => _onItemTap(8, () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  }
