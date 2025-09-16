import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AuthHeader(
            title: " أنشئ ملفك الشخصي الآن",
            subtitle: "أدخل بياناتك حتي تستفيد بكل الخدمات",
          ),
          Text(
            'رقم الهاتف',
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: Colors.black),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          CustomTextFormField(hintText: 'أدخل رقم الهاتف', icon: Icons.phone),
        ],
      ),
    );
  }
}