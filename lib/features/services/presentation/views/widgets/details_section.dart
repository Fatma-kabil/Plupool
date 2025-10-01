import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/highlight_word.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/services/data/models/pool_model.dart';

class DetailsSection extends StatelessWidget {
  final PoolModel pool;

  const DetailsSection({super.key, required this.pool});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pool.title,
            style: AppTextStyles.styleBold16(context)
                .copyWith(color: AppColors.ktextcolor),
          ),
          const SizedBox(height: 4),

          Text(
            pool.description,
            style: AppTextStyles.styleRegular13(context)
                .copyWith(color: const Color(0xff777777)),
          ),
          const SizedBox(height: 4),

          Text(
            "المميزات:",
            style: AppTextStyles.styleMedium16(context)
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 6),

          Column(
            children: pool.features.map((feature) {
              return Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/done.svg',
                    height: SizeConfig.h(16),
                    width: SizeConfig.w(16),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text.rich(
                      TextSpan(children: highlightWord(context, feature, "مناسب لـ:")),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),

          const SizedBox(height: 10),
          CustomTextBtn(text: 'احجز الان', onPressed: () {}),
        ],
      ),
    );
  }
}
