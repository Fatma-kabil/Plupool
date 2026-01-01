import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerProfileViewFooter extends StatelessWidget {
  const CustomerProfileViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: customerFooter.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(customerFooter[index]['view']);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(15),
              vertical: SizeConfig.h(12),
            ),
            decoration: BoxDecoration(
              color: AppColors.kScaffoldColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 0,
                  color: Color(0xffCDCDCD),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  customerFooter[index]['icon'],
                  color: customerFooter[index]['color'],
                  size: SizeConfig.w(24),
                ),
                SizedBox(width: SizeConfig.w(4)),
                Text(
                  customerFooter[index]['title'],
                  style: AppTextStyles.styleMedium16(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffA4A4A4),
                  size: SizeConfig.w(15),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
