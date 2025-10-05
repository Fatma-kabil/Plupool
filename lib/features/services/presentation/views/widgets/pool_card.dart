import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/services/data/models/pool_model.dart';
import 'video_section.dart';
import 'details_section.dart';

class PoolCard extends StatelessWidget {
  final PoolModel pool;
 final void Function()? onPressed;


  const PoolCard({super.key, required this.pool, this.onPressed});

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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              VideoSection(videoUrl: pool.videoUrl),
              DetailsSection(pool: pool),
                CustomTextBtn(text: 'احجز الان', onPressed:onPressed ,width: double.infinity,),
            ],
          ),
        ),
      ),
    );
  }
}
