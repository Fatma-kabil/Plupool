import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_avatar_picker.dart';
import 'package:plupool/features/profile/presentation/views/widgets/update_company_info.dart';
import 'package:plupool/features/profile/presentation/views/widgets/update_owner_info.dart';
import 'package:plupool/features/profile/presentation/views/widgets/update_tech_info.dart';
class ProfileEditViewBody extends StatelessWidget {
  const ProfileEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        // 🔄 Loading
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // ❌ Error
        if (state is UserError) {
          return Center(child: Text(state.message));
        }

        // ✅ User Loaded
        if (state is UserLoaded) {
          final user = state.user;

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.h(15)),

                /// الصورة
                ProfileAvatarPicker(
                  networkImageUrl: user.profileImage,
                  onImagePicked: (image) {},
                ),

                SizedBox(height: SizeConfig.h(30)),

                /// 👇 الفورم حسب الدور
                if (user.role == 'technician')
                  UpdateTechInfo(user: user)
                else if (user.role == 'pool_owner')
                  UpdateOwnerInfo(user: user)
                else if (user.role == 'company')
                  UpdateCompanyInfo(user: user),

                SizedBox(height: SizeConfig.h(30)),

                /// زر الحفظ
                EditButton(
                  tittle: 'حفظ المعلومات',
                  onPressed: () {
                    // هنا هتعملي updateUser
                  },
                ),

                SizedBox(height: SizeConfig.h(10)),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
