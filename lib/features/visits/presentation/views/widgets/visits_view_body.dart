import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/visits/presentation/manager/booking_visits_cubit.dart';

import 'package:plupool/features/visits/presentation/manager/visits-cubit/booking_visits_state.dart';

import 'package:plupool/features/visits/presentation/views/widgets/maintenance_section.dart';
import 'package:plupool/features/visits/presentation/views/widgets/visit_table.dart';
import 'package:plupool/features/visits/presentation/views/widgets/visits_view_header.dart';

class VisitsViewBody extends StatelessWidget {
  const VisitsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingVisitsCubit, BookingVisitsState>(
      builder: (context, state) {
        // Loading
        if (state is BookingVisitsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Error
        if (state is BookingVisitsError) {
          return Center(
            child: ErrorText(message: 
              state.message,
            ),
          );
        }

        // Success
        if (state is BookingVisitsSuccess) {
          final data = state.data;

          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: VisitsViewHeader(),
              ),

              SliverToBoxAdapter(
                child: SizedBox(height: 12),
              ),

              SliverToBoxAdapter(
                child: VisitsTable(
                  visits: data.visits,
                ),
              ),

              SliverToBoxAdapter(
                child: SizedBox(height: 25),
              ),

              SliverToBoxAdapter(
                child: MaintenanceSection(
                  visits: data.visits,
                ),
              ),
            ],
          );
        }

        // Initial
        return const SizedBox.shrink();
      },
    );
  }
}