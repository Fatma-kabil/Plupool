import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/highlight_word.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/domain/entities/pool_type_entity.dart';

class DetailsSection extends StatelessWidget {
  final PoolTypeEntity pool;

  const DetailsSection({super.key, required this.pool});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.w(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pool.nameAr,
            style: AppTextStyles.styleBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          const SizedBox(height: 4),

          Text(
            pool.descriptionAr ?? "",
            style: AppTextStyles.styleRegular13(
              context,
            ).copyWith(color: const Color(0xff777777)),
          ),

          SizedBox(height: SizeConfig.h(4)),

          Text(
            "المميزات:",
            style: AppTextStyles.styleMedium16(
              context,
            ).copyWith(color: Colors.black),
          ),

          SizedBox(height: SizeConfig.h(4)),

          if (pool.features != null && pool.features!.isNotEmpty)
            Column(
              children: pool.features!.map((feature) {
                return Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.h(6)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: SizeConfig.w(15),
                      ),
                      SizedBox(width: SizeConfig.w(6)),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: highlightWord(
                              context,
                              feature,
                              "مناسب لـ:",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}