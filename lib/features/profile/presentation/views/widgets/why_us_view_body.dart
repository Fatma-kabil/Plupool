import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/why_us_owner_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/why_us_tech_body.dart';

class WhyUsViewBody extends StatelessWidget {
  const WhyUsViewBody({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "لماذا تختار Plupool؟",
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(10)),
          Text(
            "شريكك الموثوق للتصميم الذكي، البناء، والصيانة الاحترافية لحمامات السباحة",
            style: AppTextStyles.styleRegular16(
              context,
            ).copyWith(color: Color(0xff777777)),
          ),

          SizedBox(height: SizeConfig.h(30)),
          if (role == "فني") WhyUsTechBody() else WhyUsOwnerBody(),
        ],
      ),
    );
  }
}
