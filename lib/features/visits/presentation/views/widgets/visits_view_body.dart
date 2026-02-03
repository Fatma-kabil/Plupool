import 'package:flutter/material.dart';
import 'package:plupool/features/visits/presentation/views/widgets/maintenance_section.dart';
import 'package:plupool/features/visits/presentation/views/widgets/visit_table.dart';
import 'package:plupool/features/visits/presentation/views/widgets/visits_view_header.dart';

class VisitsViewBody extends StatelessWidget {
  const VisitsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: VisitsViewHeader()),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(child: VisitsTable()),

        SliverToBoxAdapter(child: SizedBox(height: 25)),
        SliverToBoxAdapter(child: MaintenanceSection(),)
      ],
    );
  }
}
