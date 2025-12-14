import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/profile/presentation/views/widgets/company_info_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';
import 'package:plupool/features/profile/presentation/views/widgets/owner_info_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_details_header_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/tech_info_card.dart';

class ProfileDatailsViewBody extends StatelessWidget {
  const ProfileDatailsViewBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, userState) {
        if (userState is UserLoading) {
          return const Center(child: CustomLoadingIndecator());
        }

        if (userState is UserError) {
          final message = userState.message;
          return Center(child: Text("خطأ: $message"));
        }

        if (userState is UserLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileDetailsHeaderCard(model: userState.user),
                SizedBox(height: SizeConfig.h(20)),

                if (userState.user.role == 'pool_owner')
                  OwnerInfoCard(model: userState.user)
                else if (userState.user.role == 'technician')
                  TechInfoCard(model: userState.user)
                else
                  CompanyInfoCard(model: userState.user),

                SizedBox(height: SizeConfig.h(35)),
                EditButton(onPressed: () => context.push('/profileeditview')),
                SizedBox(height: SizeConfig.h(10)),
              ],
            ),
          );
        }

        // ✅ مهم جداً
        return const SizedBox.shrink();
      },
    );
  }
}
