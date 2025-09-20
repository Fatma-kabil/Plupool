

import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key,required this.projects});
  final ProjectCardModel projects;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.h(230),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
              image: AssetImage(projects.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                projects.title,
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                projects.description,
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xffBBBBBB)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
