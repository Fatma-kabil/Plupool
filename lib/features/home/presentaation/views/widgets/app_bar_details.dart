
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/app_bar_model.dart';

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({
    super.key,
    required this.model,
  });

  final AppbarModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Text(
              "أهلاً ${model.username}",
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            SizedBox(width:SizeConfig.w( 5)),
            CircleAvatar(
              radius: SizeConfig.w(17),
              backgroundImage: AssetImage(model.avatarUrl),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.h(2)),
        //    const SizedBox(height: 4),
        Row(
          children: [
            Text(
              model.subtitle,
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
            ),
            const SizedBox(width: 2),
            SvgPicture.asset(
              "assets/icons/user.svg",
              width: SizeConfig.w(15),
              height: SizeConfig.w(15),
              color: AppColors.kprimarycolor,
            ),
          ],
        ),
      ],
    );
  }
}
