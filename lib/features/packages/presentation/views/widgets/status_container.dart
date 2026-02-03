import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(12),
        horizontal: SizeConfig.w(7),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            size:SizeConfig.isWideScreen?SizeConfig.w(15): SizeConfig.w(18),
            color: const Color(0xff777777),
          ),
          SizedBox(width: SizeConfig.w(6)),
          Text(
            status,
            style: AppTextStyles.styleRegular14(
              context,
            ).copyWith(color: const Color(0xff777777)),
          ),
        ],
      ),
    );
  }
}
