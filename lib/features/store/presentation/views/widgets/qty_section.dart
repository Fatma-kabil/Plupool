import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/Qty_Btn.dart';

class QtySection extends StatelessWidget {
  const QtySection({super.key, required this.itemConts});
  final int itemConts;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QtyBtn(
          icon: Icons.add,
          backgroundcolor: AppColors.kprimarycolor,
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
          child: Text(
            toArabicNumbers(itemConts.toString()),
            style: AppTextStyles.styleRegular18(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),
        QtyBtn(
          icon: Icons.remove,
          backgroundcolor: Color(0xffCDCDCD),
          onTap: () {},
        ),
      ],
    );
  }
}
