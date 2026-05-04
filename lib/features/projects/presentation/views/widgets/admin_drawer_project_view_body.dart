import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/admin_projects_view_body.dart';
import 'package:plupool/features/projects/presentation/views/widgets/our_project_section.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/tab_with_count.dart';
class AdminDrawerProjectViewBody extends StatelessWidget {
  const AdminDrawerProjectViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          /// TabBar
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
            child: BlocBuilder<ProjectsCubit, ProjectsState>(
              builder: (context, state) {
                int count = 0;

                if (state is OurProjectsSuccess) {
                  count = state.projects.first.total;
                }

                return TabBar(
                  labelStyle: AppTextStyles.styleRegular16(context)
                      .copyWith(fontFamily: 'Cairo'),
                  unselectedLabelStyle:
                      AppTextStyles.styleRegular16(context)
                          .copyWith(fontFamily: 'Cairo'),
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
                        title: 'مشاريعنا',
                        count: count,
                      ),
                    ),
                    Tab(
                      child: TabWithCount(
                        title: 'مشاريع للشركات',
                        count: 0, // لما تعملي API ليها
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          /// TabBarView
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(6),
                vertical: SizeConfig.h(18),
              ),
              child: const TabBarView(
                children: [
                  OurProjectSection(),
                  AdminProjectsViewBody(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}