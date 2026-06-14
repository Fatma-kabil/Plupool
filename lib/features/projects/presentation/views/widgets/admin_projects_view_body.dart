import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/company_project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/projects_list.dart';
import 'package:plupool/features/projects/presentation/views/widgets/projects_view_header.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/rearrangment_row.dart';

class AdminProjectsViewBody extends StatefulWidget {
  const AdminProjectsViewBody({super.key});

  @override
  State<AdminProjectsViewBody> createState() => _AdminProjectsViewBodyState();
}

class _AdminProjectsViewBodyState extends State<AdminProjectsViewBody> {
  String selected = 'قيد التنفيذ';

  @override
  void initState() {
    super.initState();

    context.read<CompanyProjectCubit>().getCompanyProjects(
      status: 'in_Progress',
    );
  }

 
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            'الإحصائيات والأداء',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(
              color: AppColors.ktextcolor,
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: SizeConfig.h(12)),
        ),

        const SliverToBoxAdapter(
          child: ProjectsViewHeader(),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: SizeConfig.h(22)),
        ),

        SliverToBoxAdapter(
          child: RearragnmentRow(
            items: const [
              "مكتمله",
              "مجدوله",
              "قيد التنفيذ",
             
            ],
            selected: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
              });

              context.read<CompanyProjectCubit>().getCompanyProjects(
                  status: getApiStatus(value),
                  );
            },
            onTap: () {
              context.push('/addprojectview');
            },
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: SizeConfig.h(18)),
        ),

        BlocBuilder<CompanyProjectCubit, CompanyProjectState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state.error != null) {
              return SliverFillRemaining(
                child: Center(
                  child: Text(
                    'حدث خطأ أثناء تحميل المشاريع',
                  ),
                ),
              );
            }

            if (state.projects.isEmpty) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text(
                    'لا توجد مشاريع',
                  ),
                ),
              );
            }

            return ProjectsList(
              
              projects: state.projects,
            );
          },
        ),
      ],
    );
  }
}