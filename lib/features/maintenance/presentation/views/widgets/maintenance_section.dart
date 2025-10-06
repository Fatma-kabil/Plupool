// 👇 محتوى تبويب "خدمة الصيانة"
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class MaintenanceSection extends StatelessWidget {
  const MaintenanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 27),
          Text(
            textDirection: TextDirection.rtl,
            'خدمة الصيانة تشمل:',
            style: AppTextStyles.styleSemiBold20(
              context,
            ).copyWith(color: Colors.black),
          ),
          const SizedBox(height: 27),

           CustomTextBtn(text: 'احجز الان', onPressed:() {
                  
                } ,width: double.infinity,),
         
        ],
      ),
    );
  }
}
