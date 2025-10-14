import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/features/auth/presentation/views/widgets/phone_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.phoneController, // ✅ أضفنا الكنترولر هنا
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController; // ✅ تعريفه

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 4),
          Text(
            ' رقم الهاتف',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 12),
          PhoneInputField(
            controller: phoneController, // ✅ نمرره هنا
            validator: (v) => Validators.phone(v),
          ),
        ],
      ),
    );
  }
}
