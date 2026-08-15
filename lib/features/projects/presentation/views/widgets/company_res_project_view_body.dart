import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row_shimmer.dart';
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
    required this.companyResName,
  });

  final int companyResId;
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

    // جلب بيانات الشركة والإحصائيات
    context.read<UsersCubit>().getUserDetails(widget.companyResId);

    // جلب المشاريع
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

        // ================= الإحصائيات =================
        BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UserDetailsLoading) {
              return const SliverToBoxAdapter(child: TechInfoCardRowShimmer());
            }

            if (state is UserDetailsError) {
              return SliverToBoxAdapter(
                child: ErrorText(message: state.message),
              );
            }

            if (state is UserDetailsSuccess) {
              return SliverToBoxAdapter(
                child: CompanyResProjectViewHeader(
                  activeProjects: state.user.statistics['active_projects'] ?? 0,
                  completedProjects:
                      state.user.statistics['completed_projects'] ?? 0,
                  totalProjects: state.user.statistics['total_projects'] ?? 0,
                ),
              );
            }

            return const SliverToBoxAdapter(child: SizedBox());
          },
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(22))),

        // ================= الفلتر + إضافة مشروع =================
        SliverToBoxAdapter(
          child: RearragnmentRow(
            items: const ["مكتمله", "مجدولة", "قيد التنفيذ"],
            selected: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
              });

              context.read<CompanyProjectCubit>().getClientProjects(
                clientId: widget.companyResId,
                status: getApiStatusProj(value),
              );
            },

            // إضافة مشروع
            onTap: () async {
              await context.push(
                '/addprojectview',
                extra: {
                  'id': widget.companyResId,
                  'name': widget.companyResName,
                },
              );

              if (mounted) {
                context.read<UsersCubit>().getUserDetails(widget.companyResId);

                context.read<CompanyProjectCubit>().getClientProjects(
                  clientId: widget.companyResId,
                  status: getApiStatusProj(selected),
                );
              }
            },
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(18))),

        // ================= قائمة المشاريع =================
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

            return ProjectsList(
              projects: state.clientProjects,
              onChanged: () {
                if (mounted) {
                  context.read<UsersCubit>().getUserDetails(
                    widget.companyResId,
                  );

                  context.read<CompanyProjectCubit>().getClientProjects(
                    clientId: widget.companyResId,
                    status: getApiStatusProj(selected),
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
