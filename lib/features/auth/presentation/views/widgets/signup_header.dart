

import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
class SignupHeader extends StatelessWidget {
  const SignupHeader({
    super.key,  
  });

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
    
        // العنوان
        Center(
          child: Text(
           'أنشئ ملفك الشخصي الآن',
            style: AppTextStyles.styleSemiBold25(context),
            textAlign: TextAlign.center,
          ),
        ),
    
          const SizedBox(height: 8),
        Center(
          child: Text( 'أدخل بياناتك حتي تستفيد بكل الخدمات',
            textAlign: TextAlign.center,
           style: AppTextStyles.styleRegular16(context),
          ),
        ),
    
        const SizedBox(height: 22),
      ],
    );
  }
}
