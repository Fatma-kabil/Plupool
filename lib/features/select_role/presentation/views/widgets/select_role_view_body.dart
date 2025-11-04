import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
import 'role_card.dart';

class SelectRoleViewBody extends StatelessWidget {
  const SelectRoleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
        //  vertical: SizeConfig.h(20.0),
          horizontal: SizeConfig.w(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // ✅ عشان كل حاجة تكون في النص
            children: [
              Text(
                "اختر دورك",
                style: AppTextStyles.styleSemiBold32(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "حدد نوع حسابك للحصول على تجربة مخصصة",
                textAlign: TextAlign.center,
                style: AppTextStyles.styleMedium16(context),
              ),
              const SizedBox(height: 22),

              // ✅ خلي الكروت كولوم في النص بدل ListView
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(roles.length, (index) {
                  final role = roles[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: RoleCard(
                      role: role,
                      onTap: () async{
                        final selectedRole = role.title;

                      await  context.read<SelectRoleCubit>().saveSelectedRole(selectedRole);

                        if (selectedRole == "فني") {
                          context.push("/MainHomeTechView");
                        } else {
                          context.push("/MainHomeCustomerView");
                        }
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
