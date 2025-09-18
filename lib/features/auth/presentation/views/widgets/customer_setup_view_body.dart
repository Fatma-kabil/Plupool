import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/customer_setup_form.dart';
class CustomerSetupViewBody extends StatefulWidget {
  const CustomerSetupViewBody({super.key});

  @override
  State<CustomerSetupViewBody> createState() => _CustomerSetupViewBodyState();
}

class _CustomerSetupViewBodyState extends State<CustomerSetupViewBody> {
  bool acceptedTerms = false;
  final _formKey = GlobalKey<FormState>(); // ✅ حطينا الفورم كي هنا

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              title: 'أنشئ ملفك الشخصي الآن',
              subtitle: 'أدخل بياناتك حتي تستفيد بكل الخدمات',
            ),
            const SizedBox(height: 15),

            // ✅ مرر الـ formKey للـ CustomerSetupForm
            CustomerSetupForm(formKey: _formKey),

            CustomCheckbox(
              value: acceptedTerms,
              onChanged: (val) {
                setState(() {
                  acceptedTerms = val;
                });
              },
              label: 'الموافقة علي الشروط والأحكام وسياسة الخصوصية',
            ),
            const SizedBox(height: 68),

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
            const SizedBox(height: 76),
            AuthSwitchRow(
              leadingText: 'لدي حساب بالفعل',
              actionText: "تسجيل الدخول",
              onTap: () {
                context.push('/login');
              },
            ),
            SizedBox(height: 114,)
          ],
        ),
      ),
    );
  }
}
