import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_shimmer.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_profile_view_footer.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_profile_view_header.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_profile_view_middle.dart';

class TechProfileViewBody extends StatefulWidget {
  const TechProfileViewBody({super.key, required this.id});
  final int id;

  @override
  State<TechProfileViewBody> createState() => _TechProfileViewBodyState();
}

class _TechProfileViewBodyState extends State<TechProfileViewBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersCubit>().getUserDetails(widget.id);
      //  context.read<UsersCubit>().refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        /// 🔄 LOADING
        if (state is UserDetailsLoading) {
          return const CustomerProfileShimmer();
        }
        /// ❌ ERROR
        else if (state is UserDetailsError) {
          return Center(child: ErrorText(message: state.message));
        }
        /// ✅ SUCCESS
        else if (state is UserDetailsSuccess) {
          final user = state.user;
          return SingleChildScrollView(
            child: Column(
              children: [
                TechProfileViewHeader(
                  user: user.user,
                ),
                SizedBox(height: 28),
                TechProfileViewMiddle(
                  rating: user.user.totalRating??0,
                  completedTasks: 14,
                  weeklyTasks: 5,
                ),
                SizedBox(height: 22),
                TechProfileViewFooter(
                  user: user,
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
