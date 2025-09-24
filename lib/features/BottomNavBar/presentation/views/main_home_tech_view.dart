import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/build_nav_item.dart';
import 'package:plupool/features/home/presentaation/views/tech/tech_home_view.dart';
import 'package:plupool/features/profile/presentation/views/tech_profile_view.dart';
import 'package:plupool/features/store/presentation/views/tech_store_view.dart';
import 'package:plupool/features/tasks/presentation/views/tech_task_view.dart';

class MainHomeTechView extends StatefulWidget {
  const MainHomeTechView({super.key});

  @override
  State<MainHomeTechView> createState() => _MainHomeTechViewState();
}

class _MainHomeTechViewState extends State<MainHomeTechView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const TechHomeView(),
    const TechTaskView(),
    const TechStoreView(),
    const TechProfileView(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() => currentIndex = value),
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.kprimarycolor,
          unselectedItemColor: const Color(0xffBBBBBB),
          selectedLabelStyle: AppTextStyles.styleBold13(context),
          unselectedLabelStyle: AppTextStyles.styleBold13(context),

          items: [
            buildNavItem(icon: 'assets/icons/home.svg', label: 'الرئيسيه'),
            buildNavItem(icon: 'assets/icons/tasks.svg', label: 'المهام'),
            buildNavItem(icon: 'assets/icons/store.svg', label: 'المتجر'),
            buildNavItem(icon: 'assets/icons/profile.svg', label: 'حسابي'),
             
          ],
        ),
      ),
    );
  }
}
