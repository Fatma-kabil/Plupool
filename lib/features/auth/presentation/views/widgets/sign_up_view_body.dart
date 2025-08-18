import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_footer.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:plupool/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/terms_and_condictions.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch, // ياخد العرض كله
        children: [
          CustomAppBar(title: "حساب جديد"),
          SizedBox(height: 20),
          SignUpForm(
            nameController: nameController,
            phoneController: phoneController,
            passwordController: passwordController,
            formKey: _formKey,
          ),
          SizedBox(height: 20),
          TermsAndConditions(),
          SizedBox(height: 40),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },

            title: 'إنشاء حساب جديد',
          ),
          SizedBox(height: 15),
          AuthFooter(
            text: 'تمتلك حساب بالفعل؟  ',
            textbutton: 'تسجيل دخول',
            onTap: () => context.push('/login'),
          ),

          // يوزع المسافة المتبقية بالتساوي
        ],
      ),
    );
  }
}
