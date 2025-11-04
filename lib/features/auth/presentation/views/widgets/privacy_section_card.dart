import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PrivacySectionCard extends StatelessWidget {
  final String title;
  final List<String> items;

  const PrivacySectionCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(6),
        vertical: SizeConfig.h(13),
      ),
      decoration: BoxDecoration(
        //  color: const Color(0xffFAFAFA),
        border: Border.all(color: Color(0xffD4D4D4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: AppTextStyles.styleSemiBold16(context).copyWith(color: AppColors.kprimarycolor)),
            SizedBox(height: 8),
           Text(
                    textDirection: TextDirection.rtl,
                    "نحن نجمع معلوماتك الشخصية مثل الاسم والعنوان ورقم الهاتف لتقديم الخدمات المطلوبة وتحسين تجربتك.",
                    textAlign: TextAlign.right,
                    style: AppTextStyles.styleRegular13(context).copyWith(color: Colors.grey[700]),
                  ),
          SizedBox(height: 8),
          Container(
            
            decoration: BoxDecoration(
              color: Color(0xffCCE4F0),
              borderRadius: BorderRadius.circular(10),
              
              border: Border(
                
                right: BorderSide(color:AppColors.kprimarycolor,width: 3),)

            ),
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(10),vertical:SizeConfig.h(8) ),
            child: Text(
              textDirection:TextDirection.rtl,
              'نحن لا نبيع أو نؤجر معلوماتك الشخصية لأطراف ثالثة لأغراض التسويق.',style: AppTextStyles.styleRegular13(context).copyWith(color: Color(0xff555555)),),
          ),
            SizedBox(height: 8),
          ...items.map(
            (e) => 
                   Text(
                    textDirection: TextDirection.rtl,
                    e,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.styleRegular13(context).copyWith(color: Colors.grey[700]),
                  ),
                
              
            ),
          
        ],
      ),
    );
  }
}
