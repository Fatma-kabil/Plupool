import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/company_profile_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/owner_profile_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/tech_profile_body.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<SelectRoleCubit>().getSavedRole(); // ✅ مرة واحدة فقط
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig.init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(17),
            vertical: SizeConfig.h(25),
          ),
          child: BlocBuilder<SelectRoleCubit, SelectRoleState>(
            builder: (context, state) {
              if (state is GetRoleLoading || state is SelectRoleInitial) {
                return const Center(child: CircularProgressIndicator());
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
                return const Center(child: Text("حدث خطأ أثناء تحميل البيانات"));
              }
            },
          ),
        ),
      ),
    );
  }
}
