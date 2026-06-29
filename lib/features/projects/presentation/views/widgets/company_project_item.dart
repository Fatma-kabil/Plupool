import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/week_text_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';

class CompanyProjectItem extends StatelessWidget {
  const CompanyProjectItem({super.key, required this.project});

  final OurProjectEntity project;
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
            height: SizeConfig.isWideScreen
                ? SizeConfig.h(210)
                : SizeConfig.h(180),
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
                        child: Image.network(
                          project.image1 ?? "",
                          height: double.infinity,

                          fit: BoxFit.cover,

                          errorBuilder: (_, __, ___) =>
                              Container(color: Colors.grey.shade300),
                        ),
                      ),

                      Expanded(
                        child: Image.network(
                          project.image2
                           ?? "",
                          height: double.infinity,

                          fit: BoxFit.cover,

                          errorBuilder: (_, __, ___) =>
                              Container(color: Colors.grey.shade300),
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
                      color: Color(0xff2B8EC2),
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
                Text(
                  project.nameAr??"",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                SizedBox(height: SizeConfig.h(10)),
                Text(
                  project.descriptionAr??"",
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
                      size: SizeConfig.isWideScreen
                          ? SizeConfig.w(15)
                          : SizeConfig.w(18),
                    ),
                    SizedBox(width: SizeConfig.w(2)),
                    Text(
                      project.locationAr??"",
                      style: AppTextStyles.styleRegular14(
                        context,
                      ).copyWith(color: Color(0xff777777)),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.kprimarycolor,
                      size: SizeConfig.isWideScreen
                          ? SizeConfig.w(15)
                          : SizeConfig.w(18),
                    ),
                    SizedBox(width: SizeConfig.w(3)),
                    Text(
                      toArabicNumbers(weekText(project.durationWeeks ?? 0)),
                      style: AppTextStyles.styleRegular14(
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
