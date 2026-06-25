import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/company_project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_card_shimmer.dart';
import 'package:plupool/features/projects/presentation/views/widgets/projects_list.dart';
import 'package:plupool/features/projects/presentation/views/widgets/projects_view_header.dart';

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
      status: 'inProgress',
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
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(12))),

        const SliverToBoxAdapter(child: ProjectsViewHeader()),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(22))),

        SliverToBoxAdapter(
          child: FilterOption(
            value: selected,
            items: const ["مكتمله", "مجدولة", "قيد التنفيذ"],
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                selected = value;
              });

              context.read<CompanyProjectCubit>().getCompanyProjects(
                status: getApiStatusProj(value),
              );
            },
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(18))),

        BlocConsumer<CompanyProjectCubit, CompanyProjectState>(
          listener: (context, state) {
            if (state.progressUpdated) {
              showCustomSnackBar(
                context: context,
                message: "تم تحديث نسبة الإنجاز بنجاح ✅",
                isSuccess: true,
              );
               context.read<CompanyProjectCubit>().refreshClientProjects();
                
            }

            if (!state.isUpdatingProgress && state.error != null) {
              showCustomSnackBar(context: context, message: state.error!);
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const ProjectCardShimmer(),
                  childCount: 4,
                ),
              );
            }

            if (state.error != null) {
              return SliverFillRemaining(
                child: Center(
                  child: ErrorText(message: 'حدث خطأ أثناء تحميل المشاريع'),
                ),
              );
            }

            if (state.projects.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: ErrorText(message: 'لا توجد مشاريع')),
              );
            }

            return ProjectsList(projects: state.projects);
          },
        ),
      ],
    );
  }
}
