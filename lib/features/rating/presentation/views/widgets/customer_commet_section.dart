import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerCommentSection extends StatelessWidget {
  const CustomerCommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تعليق العميل',
          style: AppTextStyles.styleSemiBold16(context)
              .copyWith(color: Color(0xff555555)),
        ),
        SizedBox(height: SizeConfig.h(6)),
        Container(
          padding: EdgeInsets.all(SizeConfig.w(12)),
          decoration:  BoxDecoration(
              border: Border.all(color: AppColors.textFieldBorderColor),
              color: AppColors.kScaffoldColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.comment_outlined,
                size: SizeConfig.w(SizeConfig.isWideScreen ? 15 : 20),
                color: Color(0xffBBBBBB),
              ),
              SizedBox(width: SizeConfig.w(8)),
              Expanded(
                child: Text(
                  'الفني فيصل عمل جيد بشكل عام لكنه تأخر حوالي 20 دقيقة عن الموعد دون إشعار مسبق. العمل نفسه كان نظيفاً واحترافياً.',
                  style: AppTextStyles.styleRegular14(context)
                      .copyWith(color: Color(0xff777777)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
