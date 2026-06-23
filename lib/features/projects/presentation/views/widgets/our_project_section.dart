import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/our_project_card.dart';
import 'package:plupool/features/projects/presentation/views/widgets/our_project_shimmer_card.dart';

class OurProjectSection extends StatefulWidget {
  const OurProjectSection({super.key});

  @override
  State<OurProjectSection> createState() => _OurProjectSectionState();
}

class _OurProjectSectionState extends State<OurProjectSection> {
  String selected = "الكل";

  void onFilterChanged(String val) {
    setState(() => selected = val);

    context.read<OurProjectsCubit>().getProjects(
      hasPartener: val == "الكل" ? null : val == "الشركاء",
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// Header
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "المشاريع :",
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              AddOfferBtn(
                text: "إضافة مشروع جديد",
                onTap: () {
                  context.push('addtourprojectview');
                },
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(10))),
        SliverToBoxAdapter(
          child: FilterOption(
            value: selected,
            items: const ["الكل", "أعمالنا", "الشركاء"],
            onChanged: (val) {
              if (val != null) {
                onFilterChanged(val);
              }
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(20))),

        /// هنا فقط
        BlocBuilder<OurProjectsCubit, OurProjectsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                    child: OurProjectCardShimmer(),
                  );
                }, childCount: 4),
              );
            }

            if (state.error != null) {
              return SliverFillRemaining(
                child: Center(child: ErrorText(message: state.error!)),
              );
            }

            if (state.projects.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: ErrorText(message: "لا توجد مشاريع")),
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final project = state.projects[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                  child: OurProjectCard(project: project),
                );
              }, childCount: state.projects.length),
            );
          },
        ),
      ],
    );
  }
}
