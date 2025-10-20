import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/company_responsitive_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/customer_signup_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/signup_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/tech_setup_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/verification_body.dart';
import 'package:plupool/features/auth/presentation/views/widgets/whatsapp_verification_note.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool acceptedTerms = false;
  bool showVerificationBody = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _buildController = TextEditingController();
  final TextEditingController _workController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _locationController.dispose();
    _buildController.dispose();
    _workController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SelectRoleCubit>()..getSavedRole(),
      child: BlocBuilder<SelectRoleCubit, SelectRoleState>(
        builder: (context, state) {
          if (state is GetRoleLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetRoleError) {
            return Center(child: Text('حدث خطأ أثناء تحميل الدور 😔'));
          }

          if (state is GetRoleSuccess) {
            final selectedRole = state.roleName; // ✅ الدور المحفوظ من الكيوبت

            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.h(22),
                horizontal: SizeConfig.w(18),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SignupHeader(),
                    SizedBox(height: SizeConfig.h(15)),

                    // ✅ الفورم المناسب حسب الدور
                    if (!showVerificationBody) ...[
                      _buildSignupForm(selectedRole),

                      SizedBox(height: SizeConfig.h(20)),
                      const WhatsappVerificationNote(),
                      SizedBox(height: SizeConfig.h(40)),

                      CustomCheckbox(
                        value: acceptedTerms,
                        onChanged: (val) =>
                            setState(() => acceptedTerms = val),
                        label:
                            'الموافقة علي الشروط والأحكام وسياسة الخصوصية',
                      ),
                      SizedBox(height: SizeConfig.h(35)),

                      CustomTextBtn(
                        width: double.infinity,
                        text: 'إرسال رمز التحقق',
                        onPressed: _onSendVerificationPressed,
                      ),
                       SizedBox(height: SizeConfig.h(40)),
                    ] else ...[
                      SizedBox(height: SizeConfig.h(30)),
                      VerificationBody(
                        phoneNumber: _phoneController.text.trim(),
                        btntext: 'إنشاء الحساب',
                      ),
                      SizedBox(height: SizeConfig.h(60)),
                    ],

                    AuthSwitchRow(
                      leadingText: 'لدي حساب بالفعل',
                      actionText: 'تسجيل الدخول',
                      onTap: () => context.push('/login'),
                    ),
                    SizedBox(height: SizeConfig.h(40)),
                  ],
                ),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // 🔸 دالة بناء الفورم حسب الدور
 Widget _buildSignupForm(String role) {
  if (role.contains("حمام")) {
    // ✅ صاحب حمام سباحة
    return CustomerSignupForm(
      formKey: _formKey,
      phoneController: _phoneController,
      nameController: _nameController,
      locationController: _locationController,
    );
  } else if (role.contains("فني")) {
    // ✅ فني صيانة
    return TechSetupForm(
      formKey: _formKey,
      phoneController: _phoneController,
      nameController: _nameController,
      locationController: _locationController,
      buildController: _buildController,
      workController: _workController,
    );
  } else if (role.contains("شركة") || role.contains("مطور")) {
    // ✅ شركة أو مطور عقاري
    return CompanyRespositiveForm(
      formKey: _formKey,
      phoneController: _phoneController,
      nameController: _nameController,
    );
  } else {
    // حالة احتياطية
    return Center(
      child: Text('❌ لم يتم التعرف على نوع الحساب: $role'),
    );
  }
}


  // 🔸 زر إرسال رمز التحقق
  void _onSendVerificationPressed() {
    if (!_formKey.currentState!.validate()) return;

    if (!acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يجب الموافقة على الشروط والأحكام')),
      );
      return;
    }

    debugPrint('✅ الاسم: ${_nameController.text}');
    debugPrint('✅ رقم الهاتف: ${_phoneController.text}');
    debugPrint('✅ الموقع: ${_locationController.text}');

    setState(() => showVerificationBody = true);
  }
}
