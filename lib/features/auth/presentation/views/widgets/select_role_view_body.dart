import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';
import 'role_card.dart';

class SelectRoleViewBody extends StatelessWidget {
  const SelectRoleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // زر الرجوع باستخدام go_router
          CustomBackButton(),

          const SizedBox(height:17),

          // العنوان
          Center(
            child: Text(
              "اختر دورك",
              style: AppTextStyles.styleSemiBold32(context),
              textAlign: TextAlign.center,
            ),
          ),

            const SizedBox(height: 8),
          Center(
            child: Text(
              "حدد نوع حسابك للحصول على تجربة مخصصة",
              textAlign: TextAlign.center,
              style: AppTextStyles.styleMedium16(context),
            ),
          ),

          const SizedBox(height: 22),

          // الكروت
         Expanded(
  child: ListView.separated(
    itemCount: roles.length,
    separatorBuilder: (context, index) => const SizedBox(height: 16),
    itemBuilder: (context, index) {
      final role = roles[index];
      return RoleCard(
        role: role,
        onTap: () {
          if (index == 0) {
            // صاحب حمام سباحة
            print("اخترت صاحب حمام سباحة");
            context.push("/signup");
            // context.go("/owner");
          } else if (index == 1) {
            // فني صيانة
            print("اخترت فني صيانة");
            context.push("/signup");
            // context.go("/technician");
          } else if (index == 2) {
            // شركة أو مطور عقاري
            print("اخترت شركة أو مطور عقاري");
            context.push("/signup");
            // context.go("/company");
          }
        },
      );
    },
  ),
),

        ],
      ),
    );
  }
}
