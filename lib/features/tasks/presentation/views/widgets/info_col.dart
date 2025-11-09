
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class InfoCol extends StatelessWidget {
  final String label;
  final String value;

  const InfoCol({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    textDirection: TextDirection.rtl,
      children: [
         Text(
       textDirection: TextDirection.rtl,
            label,
            style: AppTextStyles.styleRegular16(context).copyWith(
              color: const Color(0xff555555),
            ),
          ),
          SizedBox(height: SizeConfig.h(5)),
        Text(
          value,
          style: AppTextStyles.styleSemiBold16(context).copyWith(color: AppColors.ktextcolor)
        ),
      ],
    );
  }
}
