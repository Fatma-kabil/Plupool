import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/requested_construction_section.dart';
import 'package:plupool/features/notifications/presentation/views/widgets/notification_inbox_section.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tab_with_count.dart';

class NotificationInboxViewBody extends StatefulWidget {
  const NotificationInboxViewBody({super.key});

  @override
  State<NotificationInboxViewBody> createState() =>
      _NotificationInboxViewBodyState();
}

class _NotificationInboxViewBodyState extends State<NotificationInboxViewBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          /// TabBar
          SliverToBoxAdapter(
            child: Container(
              height: SizeConfig.h(SizeConfig.isWideScreen ? 55 : 44),
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF1F1F1),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    color: Colors.black26,
                  ),
                ],
              ),
              child: TabBar(
                labelStyle: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(fontFamily: 'Cairo'),
                unselectedLabelStyle: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(fontFamily: 'Cairo'),
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
                tabs: [
                  Tab(child: TabWithCount(title: 'الوارده', count: 8)),
                  Tab(child: Text('إرسال إشعار')),
                ],
              ),
            ),
          ),

          /// TabBarView
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(6),
                vertical: SizeConfig.h(18),
              ),
              child: TabBarView(
                children: [
                  NotificationInboxSection(),
                  RequestedConstructionSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
