import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class UsageSectionCard extends StatelessWidget {
  final String title;
  final List<String> items;

  const UsageSectionCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.only(bottom: SizeConfig.h(20)),
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
          Text(
            title,
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.kprimarycolor),
          ),
          SizedBox(height: SizeConfig.h(8)),
          ...items.map(
            (e) => Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.h(6)),
              child: Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: SizeConfig.w(18)),
                    child: Text(" •", style: TextStyle(fontSize: SizeConfig.w(10))),
                  ),
                  Expanded(
                    child: Text(
                      textDirection: TextDirection.rtl,
                      e,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
