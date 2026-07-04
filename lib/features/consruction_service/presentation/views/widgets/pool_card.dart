import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/consruction_service/domain/entities/pool_type_entity.dart';
import 'details_section.dart';
import 'video_section.dart';

class PoolCard extends StatelessWidget {
  const PoolCard({super.key, required this.pool, this.onPressed});

  final PoolTypeEntity pool;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        color: AppColors.kScaffoldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xff80BBDA), width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.h(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoSection(videoUrl: pool.videoUrl),
              DetailsSection(pool: pool),
              CustomTextBtn(
                text: 'احجز الان',
                onPressed: onPressed,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
