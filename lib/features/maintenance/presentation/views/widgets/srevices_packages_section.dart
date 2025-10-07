import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/booking_card.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/confirm_package_booking_card.dart';

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

  final List<List<String>> _services = [
    [
      "3 شهور صيانة مجاناً",
      "تنظيف شامل",
      "معالجة المياه",
      "صيانة المعدات",
      "مراجعة التسريبات البسيطة",
    ],
    [
      "شهر صيانة مجاناً",
      "تنظيف شامل",
      "معالجة المياه",
      "صيانة المعدات",
      "مراجعة التسريبات البسيطة",
    ],
    [
      "تنظيف شامل",
      "معالجة المياه",
      "صيانة المعدات",
      "مراجعة التسريبات البسيطة",
    ],
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 25),
        Text(
          "باقات الخدمات",
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 9),
        Text(
          "اختر خطة الصيانة المناسبة لاحتياجاتك",
          style: AppTextStyles.styleRegular16(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
        const SizedBox(height: 24),

        // 🟦 التبويبات
        TabBar(
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
        ),

        const SizedBox(height: 24),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.98, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                ),
                child: child,
              ),
            );
          },
          child: _buildPackageContent(
            context,
            _currentIndex,
            key: ValueKey(_currentIndex),
          ),
        ),
      ],
    );
  }

  Widget _buildPackageContent(
    BuildContext context,
    int selectedIndex, {
    Key? key,
  }) {
    return SingleChildScrollView(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "العروض لعملائنا الجدد لأول مرة",
            style: AppTextStyles.styleBold14(context),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 202,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffBBBBBB)),
              color: AppColors.kScaffoldColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                _services[selectedIndex].length,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        textDirection: TextDirection.rtl,
                        _services[selectedIndex][i],
                        style: AppTextStyles.styleRegular16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        "assets/icons/done.svg",
                        height: SizeConfig.h(16),
                        width: SizeConfig.w(16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          CustomTextBtn(
            text: "اختيار الباقة",
            width: double.infinity,
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => BookingCard(
                  onConfirm: (date, time) {
                    // بعد التأكيد نعرض كارت تأكيد الحجز
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: const EdgeInsets.all(16),
                        child: ConfirmPackageBookingCard(
                          date: date,
                          time: time, packageType: _tabs[selectedIndex]

                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
