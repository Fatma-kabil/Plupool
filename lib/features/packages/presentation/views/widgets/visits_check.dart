import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class VisitsCheck extends StatelessWidget {
  const VisitsCheck({
    super.key,
    required this.value,
    required this.onChanged,
   
    
  });
  
  final bool value;
  final ValueChanged<bool> onChanged;

  

  @override
  Widget build(BuildContext context) {
    return Row(
      //   textDirection: TextDirection.rtl,
      //   mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // النص على الشمال
      
        InkWell(
          onTap: () => onChanged(!value),
          child:
              // الـ checkbox على اليمين
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: SizeConfig.isWideScreen
                    ? SizeConfig.h(13)
                    : SizeConfig.w(15),
                height: SizeConfig.isWideScreen
                    ? SizeConfig.h(13)
                    : SizeConfig.w(15),
                alignment: Alignment.center, // ✅ تثبيت الأيقونة في النص
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Color(0xffC0303A), width: 1),
                ),
                child: value
                    ? Icon(
                        Icons.check,
                        size: SizeConfig.isWideScreen
                            ? SizeConfig.h(12)
                            : SizeConfig.w(12),
                        color: AppColors.ktextcolor,
                      )
                    : null,
              ),
        ),

          Padding(
          padding: EdgeInsets.only(right: SizeConfig.w(4)),
          child: Text(
            "تذكير بالزيارة القادمة",
                
            style: AppTextStyles.styleSemiBold14(context).copyWith(
              color:  Color(0xffC0303A),
            
            ),
          ),
        ),
      

      ],
    );
  }
}
