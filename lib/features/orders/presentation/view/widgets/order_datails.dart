import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/support/presentation/views/widgets/details_btn.dart';

class OrderDatails extends StatelessWidget {
  const OrderDatails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "عدد المنتجات : 6 ",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
            Spacer(),
            DetailsBtn(onTap: () {}),
          ],
        ),
        SizedBox(height: SizeConfig.h(8)),
        Row(
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
              textDirection: TextDirection.ltr,
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
              textDirection: TextDirection.ltr,
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
                " الإجمالي الكلي  :  ",
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleRegular16(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
              Spacer(),
              Text(
                textDirection: TextDirection.ltr,
                "9050 EGP",
                //textDirection: TextDirection.rtl,
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: Color(0xff333333)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
