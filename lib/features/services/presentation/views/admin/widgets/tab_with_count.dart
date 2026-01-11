import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

/// ================= TAB WITH COUNT =================
class TabWithCount extends StatelessWidget {
  final String title;
  final int count;

  const TabWithCount({
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final color = DefaultTextStyle.of(context).style.color;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.styleRegular16(context)
              .copyWith(fontFamily: 'Cairo', color: color),
        ),
        SizedBox(width: SizeConfig.w(6)),
        Container(
          padding: EdgeInsets.all(SizeConfig.w(6)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color, // بيتغير مع selected/unselected
          ),
          child: Text(
            count.toString(),
            style: AppTextStyles.styleSemiBold14(context)
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
