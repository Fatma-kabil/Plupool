import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/service_section.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/visits_section.dart';

class ContentCard extends StatefulWidget {
  const ContentCard({super.key});

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int bottomIndex = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // white rounded card overlapping header
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(18),
                vertical: SizeConfig.h(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + small subtitle
                  Text(
                    'مرحبًا بك في Your Pool',
                    style: AppTextStyles.styleBold16(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                  SizedBox(height: SizeConfig.h(6)),
                  Text(
                    'تابع صيانة حمامك بكل سهولة',
                    style: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(color: Color(0xff777777)),
                  ),
                  SizedBox(height: SizeConfig.h(20)),

                  // Tabs (الخدمات - الزيارات)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF1F1F1),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 1),
                          color: Color(0xff000000).withOpacity(0.25),
                        ),
                      ],
                    ),
                    child: TabBar(
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(fontFamily: 'cairo'),
                      unselectedLabelStyle: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(fontFamily: 'cairo'),
                      // labelPadding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
                      indicatorPadding: EdgeInsets.symmetric(
                        vertical: SizeConfig.h(7),
                        horizontal: SizeConfig.w(7),
                      ),
                      controller: _tabController,
                      labelColor: AppColors.kprimarycolor,
                      unselectedLabelColor: Color(0xff7B7B7B),
                      indicator: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xffCCE4F0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tabs: const [
                        Tab(text: 'الخدمات'),
                        Tab(text: 'الزيارات'),
                      ],
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(20)),

                  // Content under tabs
                  SizedBox(
                    height: 1000000,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Services view (simple placeholder)
                        ServiceSection(),
                    
                        // Visits view (list of cards)
                        VisitsSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
