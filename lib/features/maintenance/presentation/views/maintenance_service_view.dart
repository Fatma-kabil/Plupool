import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/maintenance_section.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/srevices_packages_section.dart';

class MaintenanceServiceView extends StatefulWidget {
  const MaintenanceServiceView({super.key});

  @override
  State<MaintenanceServiceView> createState() => _MaintenanceServiceViewState();
}

class _MaintenanceServiceViewState extends State<MaintenanceServiceView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> tabs = [
    {'title': 'باقات الخدمات', 'icon': 'assets/icons/packages.svg'},
    {'title': 'خدمة الصيانة', 'icon': 'assets/icons/services.svg'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: 1,
    );
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); 
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        
        child: Padding(
          padding:  EdgeInsets.only(top:SizeConfig.h(30) , left: SizeConfig.w(15), right: SizeConfig.w(15)),
          child: Column(
            //  textDirection: TextDirection.rtl,
            children: [
              SizedBox(height: 15),
              // ✅ الجزء العلوي - Tabs buttons
              Row(
                //   textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (index) {
                  bool isSelected = _tabController.index == index;

                  return GestureDetector(
                    onTap: () {
                      _tabController.index = index;
                      setState(() {});
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width:
                          (screenWidth -  SizeConfig.w(16) * 2 -  SizeConfig.w(15)) /
                          2, // نصف العرض تقريبًا مع مسافة
                      padding:  EdgeInsets.symmetric(
                        horizontal:  SizeConfig.w(10),
                        vertical:  SizeConfig.h(8),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kScaffoldColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected
                                ? AppColors.kprimarycolor
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tabs[index]['title'],
                            style: AppTextStyles.styleMedium20(context)
                                .copyWith(
                                  color: isSelected
                                      ? AppColors.kprimarycolor
                                      : Color(0xffAAAAAA),
                                ),
                          ),
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                            tabs[index]['icon'],
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? AppColors.kprimarycolor
                                  : Color(0xffAAAAAA),
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // ✅ المحتوى - بدون سحب (ولا أنيميشن)
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ServicesPackagesSection(),
                    MaintenanceSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
