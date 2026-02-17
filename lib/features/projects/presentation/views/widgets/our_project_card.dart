import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/projects/presentation/views/widgets/our_project_card_footer.dart';

class OurProjectCard extends StatelessWidget {
  const OurProjectCard({super.key, required this.model});
  final ProjectCardModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              model.imageUrl,
              height: SizeConfig.isWideScreen
                  ? SizeConfig.w(115)
                  : SizeConfig.h(140),
              width: SizeConfig.w(120),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: SizeConfig.w(12)),
          Expanded(
            child: SizedBox(
              height: SizeConfig.isWideScreen
                  ? SizeConfig.w(125)
                  : SizeConfig.h(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الجزء العلوي
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),

                      SizedBox(height: SizeConfig.h(12)),
                      Text(
                        model.description,
                        softWrap: true,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleRegular13(
                          context,
                        ).copyWith(color: Color(0xff777777)),
                      ),
                    ],
                  ),
                  OurProjectCardFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
