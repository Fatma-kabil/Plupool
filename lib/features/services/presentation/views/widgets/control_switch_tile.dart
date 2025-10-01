
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ControlSwitchTile extends StatelessWidget {
  final String image;

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ControlSwitchTile({
    super.key,
    required this.image,

    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              image,
              height: SizeConfig.h(24),
              width: SizeConfig.w(24),
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: AppTextStyles.styleRegular16(
                context,
              ).copyWith(color: Colors.black),
            ),
          ],
        ),
        Transform.scale(
          scale: 0.6, // جرب 0.7 أو 0.6 كمان لو عايز أصغر
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white, // لون الدائرة لما On
            activeTrackColor: AppColors.kprimarycolor, // لون الخلفية لما On
            inactiveThumbColor: Colors.grey,     // لون الدائرة لما Off
    inactiveTrackColor: Colors.black12,  // لون الخلفية لما Off // لون الخلفية لما Off),
          ),
        ),
      ],
    );
  }
}
