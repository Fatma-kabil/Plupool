import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/signup_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/customer_signup_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/tech_setup_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/verification_body.dart';
import 'package:plupool/features/auth/presentation/views/widgets/whatsapp_verification_note.dart';

class CustomerSignupViewBody extends StatefulWidget {
  const CustomerSignupViewBody({super.key});

  @override
  State<CustomerSignupViewBody> createState() => _CustomerSignupViewBodyState();
}

class _CustomerSignupViewBodyState extends State<CustomerSignupViewBody> {
  bool acceptedTerms = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _buildController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  bool showVerificationBody = false;
  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  final String selectedrole = 'tech';

  @override
  Widget build(BuildContext context) {
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
            if (selectedrole == "customer") ...[
              CustomerSignupForm(
                formKey: _formKey,
                phoneController: _phoneController,
                nameController: _nameController,
                locationController: _locationController,
              ),
            ] else if (selectedrole == "tech") ...[
              TechSetupForm(
                formKey: _formKey,
                phoneController: _phoneController,
                nameController: _nameController,
                locationController: _locationController,
                buildController: _buildController,
                workController: _workController,
              ),
            ],

            SizedBox(height: SizeConfig.h(20)),

            const WhatsappVerificationNote(),
            SizedBox(height: SizeConfig.h(60)),

            CustomCheckbox(
              value: acceptedTerms,
              onChanged: (val) {
                setState(() {
                  acceptedTerms = val;
                });
              },
              label: 'الموافقة علي الشروط والأحكام وسياسة الخصوصية',
            ),

            // 👇 هنا بنبدّل بين الزر وواجهة التحقق
            if (!showVerificationBody) ...[
              SizedBox(height: SizeConfig.h(39)),
              CustomTextBtn(
                width: double.infinity,
                text: 'إرسال رمز التحقق',
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

                    final phone = _phoneController.text.trim();
                    final name = _nameController.text.trim();
                    final location = _locationController.text.trim();

                    debugPrint('✅ الاسم: $name');
                    debugPrint('✅ رقم الهاتف: $phone');
                    debugPrint('✅ مكان الإقامة: $location');

                    // ✅ بعد التحقق، أظهري واجهة التحقق
                    setState(() => showVerificationBody = true);
                  }
                },
              ),

              SizedBox(height: SizeConfig.h(54)),
            ] else ...[
              SizedBox(height: SizeConfig.h(40)),
              VerificationBody(
                phoneNumber: _phoneController.text.trim(),
                btntext: 'إنشاء الحساب',
              ),
              SizedBox(height: SizeConfig.h(70)),
            ],

            AuthSwitchRow(
              leadingText: 'لدي حساب بالفعل',
              actionText: "تسجيل الدخول",
              onTap: () {
                context.push('/login');
              },
            ),
            SizedBox(height: SizeConfig.h(59)),
          ],
        ),
      ),
    );
  }
}
