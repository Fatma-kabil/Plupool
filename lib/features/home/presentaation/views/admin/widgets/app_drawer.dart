import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/manager/drawer_cubit/drawer_cubit.dart';
import 'drawer_item.dart'; // استورد الـ Cubit

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kScaffoldColor,
      width: MediaQuery.of(context).size.width * 0.65,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
        child: BlocBuilder<DrawerCubit, int>(
          builder: (context, selectedIndex) {
            void onItemTap(int index, VoidCallback action) {
              context.read<DrawerCubit>().selectIndex(index);
              action();
              Navigator.pop(context); // لإغلاق الدروار بعد اختيار عنصر
            }

            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerItem(
                        icon: Icons.home_outlined,
                        title: 'الرئيسية',
                        isSelected: selectedIndex == 0,
                        onTap: () => onItemTap(0, () {
                          context.go('/');
                        }),
                      ),
                      DrawerItem(
                        icon: Icons.layers_outlined,
                        title: 'الباقات',
                        isSelected: selectedIndex == 1,
                        onTap: () => onItemTap(1, () {
                          context.go('/seeallpackagesview');
                        }),
                      ),
                      DrawerItem(
                        icon: Icons.list_alt_outlined,
                        title: 'الخدمات المطلوبة',
                        badgeCount: 10,
                        isSelected: selectedIndex == 2,
                        onTap: () => onItemTap(2, () {
                          context.go('/requestedserviceview');
                        }),
                      ),
                      DrawerItem(
                        icon: Icons.notifications_none,
                        title: 'الإشعارات',
                        badgeCount: 8,
                        isSelected: selectedIndex == 3,
                        onTap: () => onItemTap(3, () {
                          context.go('/notificationinboxview');
                        }),
                      ),
                      DrawerItem(
                        icon: Icons.people_outline,
                        title: 'العملاء',
                        isSelected: selectedIndex == 4,
                        onTap: () => onItemTap(4, () {
                          context.push('/customersview');
                        }),
                      ),
                      DrawerItem(
                        icon: Icons.engineering_outlined,
                        title: 'الفنيين',
                        isSelected: selectedIndex == 5,
                        onTap: () => onItemTap(5, () {}),
                      ),
                      DrawerItem(
                        icon: Icons.flag_outlined,
                        title: 'البلاغات',
                        badgeCount: 5,
                        isSelected: selectedIndex == 6,
                        onTap: () => onItemTap(6, () {}),
                      ),
                      DrawerItem(
                        icon: Icons.chat_outlined,
                        title: 'رسائل تواصل معنا',
                        badgeCount: 10,
                        isSelected: selectedIndex == 7,
                        onTap: () => onItemTap(7, () {}),
                      ),
                      DrawerItem(
                        icon: Icons.settings_outlined,
                        title: 'الإعدادات',
                        isSelected: selectedIndex == 8,
                        onTap: () => onItemTap(8, () {}),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
