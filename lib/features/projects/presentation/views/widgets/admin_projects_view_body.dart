import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
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
        SliverToBoxAdapter(child: ProjectsViewHeader()),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(15))),
        SliverToBoxAdapter(
          child: RearragnmentRow(
            items: ["مكتمله", "مجدوله", 'قيد التنفيذ', "عاجله"],
            selected: selected,
            onChanged: (val) {
              setState(() {
                selected = val;
              });
            },
            onTap: () {
              //   context.push('/addpackageview');
            },
          ),
        ),
          SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(15))),
        ProjectsList(selected: selected,)
      ],
    );
  }
}
