import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_view_footer.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_view_header.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_view_middle_card.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_shimmer.dart';

class CustomerProfileViewBody extends StatefulWidget {
  const CustomerProfileViewBody({super.key, required this.id});

  final int id;

  @override
  State<CustomerProfileViewBody> createState() =>
      _CustomerProfileViewBodyState();
}

class _CustomerProfileViewBodyState extends State<CustomerProfileViewBody> {
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
                CustomerProfileViewHeader(user:user.user),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(15),
                    vertical: SizeConfig.h(30),
                  ),
                  child: CustomerProfileViewMiddleCard(),
                ),

                CustomerProfileViewFooter(),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}