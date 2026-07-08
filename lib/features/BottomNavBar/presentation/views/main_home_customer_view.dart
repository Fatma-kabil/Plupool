import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_state.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/build_nav_item.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/custom_floating_action_btn.dart';
import 'package:plupool/features/home/presentaation/views/customer/customer_home_view.dart';
import 'package:plupool/features/myPool/presentation/views/mypool_view.dart';
import 'package:plupool/features/profile/presentation/views/profile_view.dart';
import 'package:plupool/features/store/presentation/views/store_view.dart';
import 'package:plupool/features/services/presentation/views/user/services_view.dart';

class MainHomeCustomerView extends StatefulWidget {
  const MainHomeCustomerView({super.key});

  @override
  State<MainHomeCustomerView> createState() => _MainHomeCustomerViewState();
}

class _MainHomeCustomerViewState extends State<MainHomeCustomerView> {
  @override
  void initState() {
    super.initState();
    // ✅ ده هيتنادى أول ما الصفحة نفسها تتفتح من جديد (مش مجرد تبويب يتغير)
    context.read<BottomNavCubit>().changeCurrentIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final pages = const [
      CustomerHomeView(),
      ServicesView(),
      MyPoolView(),
      StoreView(),
      ProfileView(),
    ];

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final currentIndex = state.currentIndex;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            extendBody: true,
            body: IndexedStack(index: currentIndex, children: pages),

            // ✅ يظهر بس في الهوم
            floatingActionButton: currentIndex == 0
                ? CustomFloatingActionButton()
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endFloat, // ✅ عاليمين تحت

            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
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
                  buildNavItem(icon: Icons.home_rounded, label: 'الرئيسيه'),
                  buildNavItem(
                    icon: Icons.miscellaneous_services_rounded,
                    label: 'الخدمات',
                  ),
                  buildNavItem(icon: Icons.pool_rounded, label: 'مسبحي'),
                  buildNavItem(icon: Icons.storefront_rounded, label: 'المتجر'),
                  buildNavItem(icon: Icons.person_rounded, label: 'حسابي'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
