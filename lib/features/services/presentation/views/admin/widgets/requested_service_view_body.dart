import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/requested_maintenance_shimmer.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requedted_cubit.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requested_state.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tab_with_count.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/requested_maintenance_section.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/requested_construction_section.dart';

class RequestedServiceViewBody extends StatefulWidget {
  const RequestedServiceViewBody({super.key});

  @override
  State<RequestedServiceViewBody> createState() =>
      _RequestedServiceViewBodyState();
}

class _RequestedServiceViewBodyState extends State<RequestedServiceViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    final cubit = context.read<RequestsCubit>();

    cubit.getTabCounts();

    cubit.getRequests(tab: "maintenance", status: "new");

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      final tab = _tabController.index == 0 ? "maintenance" : "construction";

      cubit.getRequests(tab: tab, status: "new");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsCubit, RequestsState>(
      builder: (context, state) {
        final cubit = context.read<RequestsCubit>();

        final maintenanceCount = cubit.tabCounts?.maintenance ?? 0;

        final constructionCount = cubit.tabCounts?.construction ?? 0;

        if (state is RequestsError) {
          return Center(child: ErrorText(message: state.message));
        }

        if (state is RequestsLoading) {
          return RequestedMaintenanceShimmer();
        }

        return Column(
          children: [
            /// 🧭 TAB BAR
            Container(
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
                controller: _tabController,
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
                  Tab(
                    child: TabWithCount(
                      title: 'الصيانة',
                      count: maintenanceCount,
                    ),
                  ),
                  Tab(
                    child: TabWithCount(
                      title: 'الإنشاء',
                      count: constructionCount,
                    ),
                  ),
                ],
              ),
            ),

            /// 📦 CONTENT
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(6),
                  vertical: SizeConfig.h(18),
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    RequestedMaintenanceSection(),
                    RequestedConstructionSection(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
