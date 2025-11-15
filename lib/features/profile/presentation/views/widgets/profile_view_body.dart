
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/profile/presentation/views/widgets/company_profile_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/owner_profile_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/tech_profile_body.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectRoleCubit, SelectRoleState>(
      builder: (context, state) {
        if (state is GetRoleLoading || state is SelectRoleInitial) {
          return CustomLoadingIndecator();
        } else if (state is GetRoleSuccess) {
          final role = state.roleName;
    
          if (role.contains("حمام")) {
            return const OwnerProfileBody();
          } else if (role.contains("فني")) {
            return const TechProfileBody();
          } else if (role.contains("شركة") || role.contains("مطور")) {
            return const CompanyProfileBody();
          } else {
            return
            //  showCustomSnackBar(context: context, message: message)
            const Center(child: Text("لم يتم تحديد الدور"));
          }
        } else if (state is GetRoleEmpty) {
          return const Center(child: Text("لم يتم حفظ أي دور"));
        } else {
          return const Center(
            child: Text("حدث خطأ أثناء تحميل البيانات"),
          );
        }
      },
    );
  }
}
