import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_footer.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:plupool/features/auth/presentation/views/widgets/google_button.dart';
import 'package:plupool/features/auth/presentation/views/widgets/guest_continue.dart';

import 'package:plupool/features/auth/presentation/views/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isWide = SizeConfig.screenWidth > 800;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch, // ياخد العرض كله
        children: [
          CustomAppBar(title: "تسجيل الدخول"),
          SizedBox(height: 20),
          LoginForm(
            phoneController: phoneController,
            passwordController: passwordController,
            formKey: _formKey,
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? SizeConfig.w(30) : SizeConfig.w(15),
              ),
              child: Text(
                'نسيت كلمه المرور؟',
                textAlign: TextAlign.start,
                style: AppTextStyles.styleMedium20(
                  context,
                ).copyWith(color: buttonColor),
              ),
            ),
          ),
          SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },

            title: 'تسجيل دخول',
          ),
          SizedBox(height: 10),
          AuthFooter(),
          SizedBox(height: 60),
          CustomDivider(),
          SizedBox(height: 20),
          GoogleButton(),
           SizedBox(height: SizeConfig.h(60)), // يوزع المسافة المتبقية بالتساوي
  
          GuestContinue(onTap: () {
            
          }),
           // يوزع المسافة المتبقية بالتساوي
  
        ],
      ),
    );
  }
}
