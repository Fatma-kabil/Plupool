import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/booking_card.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/confirm_package_booking_card.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/package_card.dart';

class ServicesPackagesSection extends StatefulWidget {
  const ServicesPackagesSection({super.key});

  @override
  State<ServicesPackagesSection> createState() =>
      _ServicesPackagesSectionState();
}

class _ServicesPackagesSectionState extends State<ServicesPackagesSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 2;

  final List<String> _tabs = [
    "الباقة السنوية",
    "الباقة (4 شهور)",
    "الباقة الشهرية",
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: _currentIndex,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() => _currentIndex = _tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onSelectPackage(BuildContext context, String packageType) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => BookingCard(
        onConfirm: (date, time) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(16),
              child: ConfirmPackageBookingCard(
                date: date,
                time: time,
                packageType: packageType,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 25),
        Text(
          "باقات الخدمات",
          style: AppTextStyles.styleBold16(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 9),
        Text(
          "اختر خطة الصيانة المناسبة لاحتياجاتك",
          style: AppTextStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff777777)),
        ),
        const SizedBox(height: 24),

        _buildTabBar(),

        const SizedBox(height: 24),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: PackageCard(
            key: ValueKey(_currentIndex),
            title: "العروض لعملائنا الجدد لأول مرة",
            services: services[_currentIndex],
            onSelect: () => _onSelectPackage(context, _tabs[_currentIndex]),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: AppColors.kprimarycolor,
      indicatorWeight: 2.5,
      labelColor: AppColors.kprimarycolor,
      unselectedLabelColor: const Color(0xffAAAAAA),
      labelStyle: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      tabs: _tabs.map((t) => Tab(text: t)).toList(),
    );
  }
}
