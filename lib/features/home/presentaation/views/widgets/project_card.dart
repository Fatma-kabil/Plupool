import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectCardModel project;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.w(3)),
      decoration: BoxDecoration(
      //  color: Colors.white,
        borderRadius: BorderRadius.circular(18),
       border: Border.all(color: AppColors.textFieldBorderColor),
       
      ),
      child: Column(
        children: [
          /// الصور
          SizedBox(
            height: SizeConfig.h(180),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          project.imageUrlBefore,
                          fit: BoxFit.cover,
                          height: double.infinity,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          project.imageUrlAfter,
                          fit: BoxFit.cover,
                          height: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),

                /// خط المنتصف
                Positioned.fill(
                  child: Center(
                    child: Container(width: 2, color: Colors.white),
                  ),
                ),

                /// زر السحب
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: SizeConfig.w(30),
                      height: SizeConfig.h(30),
                      decoration: BoxDecoration(
                        color: AppColors.kprimarycolor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.15),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.compare_arrows,
                        color: Colors.white,
                        size: SizeConfig.w(16),
                      ),
                    ),
                  ),
                ),

                /// قبل
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "قبل",
                      style: AppTextStyles.styleSemiBold13(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),

                /// بعد
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kprimarycolor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "بعد",
                      style: AppTextStyles.styleSemiBold13(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
                if ((project.companyName?.isNotEmpty ?? false) &&
                    (project.companyImage?.isNotEmpty ?? false))
                  /// بالتعاون
                  Positioned(
                    bottom: 14,
                    right: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff14C38E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.handshake,
                            color: Colors.white,
                            size: SizeConfig.w(16),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "بالتعاون",
                            style: AppTextStyles.styleSemiBold13(
                              context,
                            ).copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(16),
              vertical: SizeConfig.h(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// الشركة
                if ((project.companyName?.isNotEmpty ?? false) &&
                    (project.companyImage?.isNotEmpty ?? false))
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          project.companyImage!,
                          width: SizeConfig.w(30),
                          height: SizeConfig.h(30),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Text(
                        project.companyName!,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.kprimarycolor),
                      ),
                    ],
                  ),
                SizedBox(height: SizeConfig.h(20)),
                Text(
                  project.title,
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                SizedBox(height: SizeConfig.h(10)),
                Text(
                  project.description,
                  maxLines: 2,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),

                SizedBox(height: SizeConfig.h(10)),

                const Divider(),

                SizedBox(height: 10),

                /// المكان والمدة
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.kprimarycolor,
                      size: SizeConfig.w(18),
                    ),
                    SizedBox(width: SizeConfig.w(2)),
                    Text(
                      project.location,
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.kprimarycolor,
                      size: SizeConfig.w(18),
                    ),
                    SizedBox(width: SizeConfig.w(3)),
                    Text(
                      project.duration,
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
