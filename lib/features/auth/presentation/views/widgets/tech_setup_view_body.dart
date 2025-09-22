import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/tech_setup_form.dart';

class TechSetupViewBody extends StatefulWidget {
  const TechSetupViewBody({super.key});

  @override
  State<TechSetupViewBody> createState() => _TechSetupViewBodyState();
}

class _TechSetupViewBodyState extends State<TechSetupViewBody> {
  bool acceptedTerms = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24), // مسافة يمين وشمال
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // ✅ زر الرجوع
            const CustomBackButton(),

            const SizedBox(height: 14),
            Center(
              child: Text(
                'كمل معلوماتك للوصول لجميع \nالخدمات',
                style: AppTextStyles.styleSemiBold25(context),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 6),
            TechSetupForm(formKey: _formKey),

            CustomCheckbox(
              value: acceptedTerms,
              onChanged: (val) {
                setState(() {
                  acceptedTerms = val;
                });
              },
              label: 'الموافقة علي الشروط والأحكام وسياسة الخصوصية',
            ),
            const SizedBox(height: 36),

            CustomTextBtn(
              text: 'إنشاء الحساب',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (!acceptedTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('يجب الموافقة على الشروط والأحكام'),
                      ),
                    );
                    return;
                  }
                  // ✅ هنا تضيفي اللوجيك بتاع إنشاء الحساب
                  // context.push('/verification');
                }
              },
            ),
            const SizedBox(height: 31),
            AuthSwitchRow(
              leadingText: 'لدي حساب بالفعل',
              actionText: "تسجيل الدخول",
              onTap: () {
                 context.push('/login');
              },
            ),
            SizedBox(height: 107),
          ],
        ),
      ),
    );
  }
}
