import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class DeleteWarningCard extends StatelessWidget {
  const DeleteWarningCard({super.key, required this.value, required this.onChanged});
   final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(SizeConfig.w(12)),
          decoration: BoxDecoration(
            color: const Color(0xffFAD7DA),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "تنبيه هام",
                    style: AppTextStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: Color(0xffE63946)),
                  ),
                  SizedBox(width:SizeConfig.w(4) ),
                  Icon(Icons.warning_amber_rounded, color: Color(0xffE63946),size: SizeConfig.w(18),),
                ],
              ),
               SizedBox(height: SizeConfig.h(8)),
               Text(
                "سيتم حذف حسابك وكل بياناتك بشكل نهائي، ولن يمكنك استعادتها لاحقًا.",
                textAlign: TextAlign.right,
                style:AppTextStyles.styleSemiBold16(context).copyWith(color: AppColors.ktextcolor)
              ),
              SizedBox(height: SizeConfig.h(8)),
               Text(
                textDirection: TextDirection.rtl,
                "• سيتم حذف معلوماتك الشخصية.\n• سيتم حذف طلباتك وسجل مشترياتك.\n• لن تتمكن من تسجيل الدخول باستخدام هذا الحساب مرة أخرى.",
                textAlign: TextAlign.right,
                style: AppTextStyles.styleRegular14(context).copyWith(color: Color(0xff555555),height: 1.9)
              ),
              
             
            ],
          ),
        ),
         SizedBox(height: SizeConfig.h( 35)),
                Row(
          //   textDirection: TextDirection.rtl,
          //   mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // النص على الشمال
           
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(right:SizeConfig.w(6) ),
                child: Text(
                  textDirection: TextDirection.rtl,
                  'أقر بأنني أفهم أن عملية الحذف نهائية ولا يمكن التراجع عنها.',
                  style: AppTextStyles.styleRegular14(context).copyWith(color: Color(0xff777777)),
                ),
              ),
            ),
        
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
                      border: Border.all(color: AppColors.ktextcolor, width: 1),
                    ),
                    child: value
                        ? Icon(
                            Icons.check,
                            size: SizeConfig.isWideScreen
                                ? SizeConfig.h(12)
                                : SizeConfig.w(12),
                            color: AppColors.kprimarycolor,
                          )
                        : null,
                  ),
            ),
          ],
        )
      ],
    );
  }
}
