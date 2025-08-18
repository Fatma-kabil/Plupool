import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:plupool/features/auth/presentation/views/widgets/password_recovery_row.dart';

class PasswordRecoveryBody extends StatelessWidget {
  const PasswordRecoveryBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWide = SizeConfig.screenWidth > 800;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(title: 'التحقق من الرمز'),
          SizedBox(height: SizeConfig.h(20)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? SizeConfig.w(30) : SizeConfig.w(15),
            ),
            child: Text(
              'أدخل الرمز المرسل إلى رقم هاتفك ********011 لاستعادة كلمة المرور.',
              style: AppTextStyles.styleNormal18(context).copyWith(
                color: Color(0xff4E5556),
                fontSize: isWide ? 24 : null,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          SizedBox(height: 30),
          PasswordRecoveryRow(),
          SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              // Handle the verification logic here
              context.push('/ressetpassword');
            },
            title: ' تحقق من الرمز',
          ),
          SizedBox(height: 20),
          GestureDetector(
            child: Text(
              'إعادة إرسال الرمز',
              style: AppTextStyles.styleMedium18(context).copyWith(
                color: Color(0xff0CD6BE),
                fontSize: isWide ? 26 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
