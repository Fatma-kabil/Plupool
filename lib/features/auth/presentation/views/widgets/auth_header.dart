

import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key, required this.title, required this.subtitle,
  });

  final String title ;
  final String subtitle ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
    
        // زر الرجوع باستخدام go_router
        CustomBackButton(),
    
        const SizedBox(height: 17),
    
        // العنوان
        Center(
          child: Text(
           title,
            style: AppTextStyles.styleSemiBold25(context),
            textAlign: TextAlign.center,
          ),
        ),
    
          const SizedBox(height: 8),
        Center(
          child: Text(subtitle,
            textAlign: TextAlign.center,
           style: AppTextStyles.styleRegular16(context),
          ),
        ),
    
        const SizedBox(height: 22),
      ],
    );
  }
}
