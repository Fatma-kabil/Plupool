import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/injection.dart' as SizeConfig;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/build_nav_item.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/custom_floating_action_btn.dart';
import 'package:plupool/features/home/presentaation/views/customer/customer_home_view.dart';
import 'package:plupool/features/myPool/presentation/views/mypool_view.dart';
import 'package:plupool/features/profile/presentation/views/customer_profilr_view.dart';
import 'package:plupool/features/store/presentation/views/store_view.dart';
import 'package:plupool/features/services/presentation/views/services_view.dart';

class MainHomeCustomerView extends StatelessWidget {
  const MainHomeCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [
      CustomerHomeView(),
      ServicesView(),
      MyPoolView(),
      StoreView(),
      CustomerProfilrView(),
    ];

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final currentIndex = state.index;
 SizeConfig.init(context); // 👈 لازم يتنده هنا
        return Scaffold(
          extendBody: true,
          body: IndexedStack(index: currentIndex, children: pages),

          // ✅ يظهر بس في الهوم
          floatingActionButton: currentIndex == 0
              ? CustomFloatingActionButton()
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.endFloat, // ✅ عاليمين تحت

          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) =>
                  context.read<BottomNavCubit>().changeCurrentIndex(value),
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
                buildNavItem(
                  icon: 'assets/icons/services.svg',
                  label: 'الخدمات',
                ),
                buildNavItem(
                  icon: 'assets/icons/construct.svg',
                  label: 'حمامي',
                ),
                buildNavItem(icon: 'assets/icons/store.svg', label: 'المتجر'),
                buildNavItem(icon: 'assets/icons/profile.svg', label: 'حسابي'),
              ],
            ),
          ),
        );
      },
    );
  }
}
