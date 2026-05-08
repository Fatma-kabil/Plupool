import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/company_res_profile_view_footer.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/company_res_profile_view_header.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/compay_res_profile_shimmer.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';

class CompanyResProfileBody extends StatefulWidget {
  const CompanyResProfileBody({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<CompanyResProfileBody> createState() =>
      _CompanyResProfileBodyState();
}

class _CompanyResProfileBodyState
    extends State<CompanyResProfileBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersCubit>().getUserDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        /// 🔄 LOADING
        if (state is UserDetailsLoading) {
          return const CompanyResProfileShimmer();
        }

        /// ❌ ERROR
        else if (state is UserDetailsError) {
          return Center(
            child: ErrorText(
              message: state.message,
            ),
          );
        }

        /// ✅ SUCCESS
        else if (state is UserDetailsSuccess) {
          final user = state.user;

          return SingleChildScrollView(
            child: Column(
              children: [
                CompanyResProfileViewHeader(
                  user: user.user,
                ),

                SizedBox(height: SizeConfig.h(20)),

                CompanyResProfileViewFooter(
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