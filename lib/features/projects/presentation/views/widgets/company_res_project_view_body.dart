import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/company_project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/company_res_project_view_header.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_card_shimmer.dart';
import 'package:plupool/features/projects/presentation/views/widgets/projects_list.dart';
import 'package:plupool/features/services/presentation/views/admin/widgets/rearrangment_row.dart';

class CompanyResProjectViewBody extends StatefulWidget {
  const CompanyResProjectViewBody({
    super.key,
    required this.companyResId,
    required this.completedProjects,
    required this.activeProjects,
    required this.companyResName,
  });

  final int companyResId;
  final int completedProjects;
  final int activeProjects;
  final String companyResName;

  @override
  State<CompanyResProjectViewBody> createState() =>
      _CompanyResProjectViewBodyState();
}

class _CompanyResProjectViewBodyState extends State<CompanyResProjectViewBody> {
  String selected = 'قيد التنفيذ';

  @override
  void initState() {
    super.initState();

    context.read<CompanyProjectCubit>().getClientProjects(
      clientId: widget.companyResId,
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

        SliverToBoxAdapter(
          child: CompanyResProjectViewHeader(
            activeProjects: widget.activeProjects,
            completedProjects: widget.completedProjects,
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(22))),

        SliverToBoxAdapter(
          child: RearragnmentRow(
            items: const ["مكتمله", "مجدولة", "قيد التنفيذ"],
            selected: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
              });

              final status = getApiStatusProj(value);

              print('Selected: $value');
              print('Status: $status');

              context.read<CompanyProjectCubit>().getClientProjects(
                clientId: widget.companyResId,
                status: status,
              );
            },
            onTap: () {
              context.push(
                '/addprojectview',
                extra: {
                  'id': widget.companyResId,
                  'name': widget.companyResName,
                },
              );
            },
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(18))),

        BlocBuilder<CompanyProjectCubit, CompanyProjectState>(
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
                child: Center(child: ErrorText(message: state.error!)),
              );
            }

            if (state.clientProjects.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: ErrorText(message: 'لا توجد مشاريع')),
              );
            }

            return ProjectsList(projects: state.clientProjects);
          },
        ),
      ],
    );
  }
}
