import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/header_text.dart';

class ConfirmDeleteCard extends StatelessWidget {
  const ConfirmDeleteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(16) , vertical: SizeConfig.h(29)),
      child: Container(
        width: SizeConfig.isWideScreen?SizeConfig.screenWidth*065:double.infinity,
        padding:  EdgeInsets.only(
          left: SizeConfig.w(16),
          right: SizeConfig.w(16),
          bottom: SizeConfig.h(25),
          top: SizeConfig.h(20),
        ),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            HeaderText(
              title: 'هل أنت متأكد؟',
              subtitle:
                "سيتم حذف حسابك بشكل نهائي ولن تتمكن من استعادته. هل تريد المتابعة؟"
            ),

            SizedBox(height: SizeConfig.h(30)),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xffE63946)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "لا، العودة",
                      style:AppTextStyles.styleMedium16(context).copyWith(
                        color: Color(0xffE63946),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.w(12)),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE63946),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      
                    },
                    child: Text(
                      "نعم أحذف الحساب",
                      style:AppTextStyles.styleMedium16(context).copyWith(
                        color: Color(0xffE63946),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}