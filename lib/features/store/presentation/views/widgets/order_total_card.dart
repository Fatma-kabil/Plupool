
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class OrderTotalCard extends StatelessWidget {
  const OrderTotalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "عدد المنتجات : 6 ",
            textDirection: TextDirection.rtl,
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: Color(0xff555555)),
          ),
          SizedBox(height: SizeConfig.h(8)),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "الإجمالي",
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
              Spacer(),
              Text(
                "9000 EGP",
                // textDirection: TextDirection.rtl,
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "رسوم التوصيل",
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
              Spacer(),
              Text(
                "50 EGP",
                //  textDirection: TextDirection.rtl,
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(4)),
          Divider(color: AppColors.textFieldBorderColor),
          // SizedBox(height: SizeConfig.h(4)),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(4),
              horizontal: SizeConfig.w(55),
            ),
            child: Row(
              children: [
                Text(
                  "9050 EGP",
                  //textDirection: TextDirection.rtl,
                  style: AppTextStyles.styleBold16(
                    context,
                  ).copyWith(color: Color(0xff333333)),
                ),
                Spacer(),
                Text(
                  " الإجمالي الكلي  :  ",
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.styleRegular16(
                    context,
                  ).copyWith(color: Color(0xff555555)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
