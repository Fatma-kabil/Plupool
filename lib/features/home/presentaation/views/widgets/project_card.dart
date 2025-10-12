import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.projects});
  final ProjectCardModel projects;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// الصورة الخلفية
        Container(
      margin:  EdgeInsets.only(right: SizeConfig.w(10)),
          width: double.infinity,
          height: SizeConfig.isWideScreen?SizeConfig.w(215): SizeConfig.h(230),
          
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(projects.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// طبقة سودة شفافة فوق الصورة
        Container(
          margin:  EdgeInsets.only(right:SizeConfig.w(10) ),
          width: double.infinity,
          height: SizeConfig.isWideScreen?SizeConfig.w(215): SizeConfig.h(230),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.45), // 🔹 هنا الـ overlay
          ),
        ),

        /// النصوص
        Positioned(
          bottom:SizeConfig.h(13) ,
          right: SizeConfig.w(23),
          left: SizeConfig.w(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                projects.title,
                style: AppTextStyles.styleSemiBold16(context)
                    .copyWith(color: Colors.white),
              ),
               SizedBox(height: SizeConfig.h(5)),
              Text(
                projects.description,
                style: AppTextStyles.styleRegular13(context)
                    .copyWith(color: const Color(0xffBBBBBB)),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
