import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

/// ================= TAB WITH COUNT =================
class TabWithCount extends StatelessWidget {
  final String title;
  final int count;

  const TabWithCount({super.key, 
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
  constraints: BoxConstraints(
    minWidth: SizeConfig.w(22),
    minHeight: SizeConfig.w(22),
  ),
  alignment: Alignment.center,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: color,
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
