import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/BottomNavBar/presentation/views/widgets/build_nav_item.dart';
import 'package:plupool/features/construct/presentation/views/customer_construct_view.dart';
import 'package:plupool/features/home/presentaation/views/customer/customer_home_view.dart';
import 'package:plupool/features/store/presentation/views/customer_store_view.dart';
import 'package:plupool/features/more/presentation/views/more_view.dart';
import 'package:plupool/features/services/presentation/views/customer_services_view.dart';

class MainHomeCustomerView extends StatefulWidget {
  const MainHomeCustomerView({super.key});

  @override
  State<MainHomeCustomerView> createState() => _MainHomeCustomerViewState();
}

class _MainHomeCustomerViewState extends State<MainHomeCustomerView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const CustomerHomeView(),
    const CustomerConstructView(),
    const CustomerServicesView(),
    const CustomerStoreView(),
    const MoreView(),
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
            buildNavItem(icon: 'assets/icons/construct.svg', label: 'إنشاء'),
            buildNavItem(icon: 'assets/icons/services.svg', label: 'صيانة'),
            buildNavItem(icon: 'assets/icons/store.svg', label: 'المتجر'),
            buildNavItem(icon: 'assets/icons/more.svg', label: 'المزيد'),
          ],
        ),
      ),
    );
  }
}
