import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/done_contact_us_card.dart';

class ReportTechnicianAbsence extends StatelessWidget {
  const ReportTechnicianAbsence({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth =
        SizeConfig.screenWidth * 0.75; // 👈 يخليها 85% من عرض الشاشة
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(35),
      ),
      child: Container(
        width: SizeConfig.isWideScreen ? cardWidth : double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(16),
          vertical: SizeConfig.h(43),
        ),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.report_problem,
              size: SizeConfig.w(130),
              color: Color(0xffFFAF42),
            ),
            SizedBox(height:SizeConfig.h(15) ),
            Center(
              child: Text(
                textDirection: TextDirection.rtl,
                "هل متأكد من الإبلاغ عن غياب الفني؟",
                style: AppTextStyles.styleSemiBold20(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height:SizeConfig.h(15) ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(16)),
                child: Text(
                  textDirection: TextDirection.rtl,
                  "سيتم مراجعة البلاغ من فريق الدعم والتواصل معك في أقرب وقت.",
                  style: AppTextStyles.styleRegular16(
                    context,
                  ).copyWith(color: Color(0xff555555)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
              SizedBox(height:SizeConfig.h(25) ),
            Row(
              textDirection: TextDirection.rtl,

              children: [
                CustomTextBtn(
                  text: "تأكيد الابلاغ",
                  onPressed: () {
                   
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(child: const DoneContactUsCard()),
                    );
                  },
                  padding: SizeConfig.w(8),
                ),
                Spacer(),
                CustomOutlinedBtn(
                  padding:SizeConfig.isWideScreen?20: 10,
                  width: SizeConfig.isWideScreen?190: 120,
                  text: "إلغاء",
                 
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
