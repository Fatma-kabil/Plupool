import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/projects/presentation/views/widgets/company_projects_list.dart';
import 'package:plupool/features/projects/presentation/views/widgets/users_projects_list.dart';

class UsersProjectsViewBody extends StatelessWidget {
  const UsersProjectsViewBody({super.key, required this.projects});
  final List<ProjectCardModel> projects;

  @override
  Widget build(BuildContext context) {
    final ourProjects = projects
        .where(
          (project) =>
              (project.companyName?.trim().isEmpty ?? true) &&
              (project.companyImage?.trim().isEmpty ?? true),
        )
        .toList();

    final companyProjects = projects
        .where(
          (project) =>
              (project.companyName?.trim().isNotEmpty ?? false) ||
              (project.companyImage?.trim().isNotEmpty ?? false),
        )
        .toList();
    return DefaultTabController(
      length: 2,
      child:
       Column(
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
                Tab(child: Text('أعمالنا')),
                Tab(child: Text('أعمالنا مع الشركات')),
              ],
            ),
          ),
       
          /// TabBarView
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(6),
                vertical: SizeConfig.h(18),
              ),
              child:  TabBarView(
                children: [
                  UsersProjectsList(projects: ourProjects),
                  CompanyProjectsList(projects: companyProjects),
                ],
              ),
            ),
          ),
        ],
             ),
    );
  }
}
