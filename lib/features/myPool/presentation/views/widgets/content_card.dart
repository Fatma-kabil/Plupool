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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF1F1F1),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 1),
                  color: Colors.black26,
                ),
              ],
            ),
            child: TabBar(
              onTap: (i) {
                setState(() {
                  currentIndex = i;
                });
              },
              labelStyle: AppTextStyles.styleMedium16(
                context,
              ).copyWith(fontFamily: 'cairo'),
              unselectedLabelStyle: AppTextStyles.styleMedium16(
                context,
              ).copyWith(fontFamily: 'cairo'),
              labelPadding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
              indicatorPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.h(7),
                horizontal: SizeConfig.w(7),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              labelColor: AppColors.kprimarycolor,
              unselectedLabelColor: const Color(0xff7B7B7B),
              indicator: BoxDecoration(
                color: const Color(0xffCCE4F0),
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: const [
                Tab(text: 'الخدمات'),
                Tab(text: 'الزيارات'),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.h(20)),

          /// ---- هنا السحر ----
          /// IndexedStack يسمح إن كل تاب يبقى ارتفاعه حسب محتواه
          /// ومفيش أي مشاكل Layout
          IndexedStack(
            index: currentIndex,
            children: const [ServiceSection(), VisitsSection()],
          ),
        ],
      ),
    );
  }
}
