import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/build_nav_item.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/custom_floating_action_btn.dart';
import 'package:plupool/features/home/presentaation/views/tech/tech_home_view.dart';
import 'package:plupool/features/profile/presentation/views/profile_view.dart';
import 'package:plupool/features/store/presentation/views/store_view.dart';
import 'package:plupool/features/tasks/presentation/views/tech_task_view.dart';

class MainHomeTechView extends StatefulWidget {
  const MainHomeTechView({super.key});

  @override
  State<MainHomeTechView> createState() => _MainHomeTechViewState();
}
class _MainHomeTechViewState extends State<MainHomeTechView> {
  @override
  void initState() {
    super.initState();
    context.read<BottomNavCubit>().changeCurrentIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final currentIndex = state.currentIndex;
        final filter = state.filter;

        // ابني الصفحات هنا مش ثابتة
        final pages = [
          const TechHomeView(),
          const TechTaskView(),
          StoreView(initialFilter: filter), // هنا بتمرير الفلتر
          const ProfileView(),
        ];

        return Directionality(
          textDirection:  TextDirection.rtl,
          child: Scaffold(
            extendBody: true,
            body: IndexedStack(index: currentIndex, children: pages),
            floatingActionButton: currentIndex == 0
                ? const CustomFloatingActionButton()
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (value) => context.read<BottomNavCubit>().changeCurrentIndex(value),
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
          ),
        );
      },
    );
  }
}
