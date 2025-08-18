import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:plupool/features/auth/presentation/views/widgets/resset_password_form.dart';

class RessetPasswordBody extends StatelessWidget {
  RessetPasswordBody({super.key});

  final _formKey = GlobalKey<FormState>();

  final newPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomAppBar(title: 'كلمة مرور جديدة'),
           SizedBox(height: SizeConfig.h(20)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.isWideScreen ? SizeConfig.w(30) : SizeConfig.w(15),
            ),
            child: Text(
              'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
              style: AppTextStyles.styleRegular18(context),
              textDirection: TextDirection.rtl,
            ),
          ),
          SizedBox(height: 20),
          RessetPasswordForm(
            newPasswordController: newPasswordController,
            passwordController: passwordController,
            formKey: _formKey,
          ),
           SizedBox(height: 20),
           CustomButton(title: 'إنشاء كلمة مرور جديدة', onPressed: () {
             
           },)
        ],
      ),
    );
  }
}
