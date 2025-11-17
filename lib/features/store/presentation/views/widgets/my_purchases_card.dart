import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:intl/intl.dart' as intl;
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';
import 'package:plupool/features/store/presentation/views/widgets/total_and_status.dart';

class MyPurchasesCard extends StatelessWidget {
  MyPurchasesCard({super.key});
  final date = DateTime(2025, 10, 22, 11, 00);

  @override
  Widget build(BuildContext context) {
    // ✅ صيغة التاريخ بدون تعارض
    final formattedDate = intl.DateFormat(
      'yyyy/MM/dd – hh:mm a',
    ).format(date).replaceAll('AM', 'ص').replaceAll('PM', 'م');

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "طلب رقم #12345",
            textDirection: TextDirection.rtl,
            style: AppTextStyles.styleSemiBold14(
              context,
            ).copyWith(color: Color(0xff7B7B7B)),
          ),
          SizedBox(height: SizeConfig.h(4)),
          TimeDateRow(formattedDate: formattedDate),
          SizedBox(height: SizeConfig.h(4)),
          Divider(color: AppColors.textFieldBorderColor),
          SizedBox(height: SizeConfig.h(4)),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/mach_pro2.png",
                  width: SizeConfig.w(69),
                  height: SizeConfig.h(88),
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: SizeConfig.w(12)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "مضخة مياه عالية الكفاءة",
                    style: AppTextStyles.styleSemiBold14(
                      context,
                    ).copyWith(color: Color(0xff7B7B7B)),
                  ),
                  SizedBox(height: SizeConfig.h(5)),
                  Text(
                    "3000 EGP",
                    style: AppTextStyles.styleBold14(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(4)),
          Divider(color: AppColors.textFieldBorderColor),
          SizedBox(height: SizeConfig.h(4)),
          TotalAndStatus(),
        ],
      ),
    );
  }
}
