import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/presentation/views/widgets/our_project_card_footer.dart';

class OurProjectCard extends StatelessWidget {
  const OurProjectCard({super.key, required this.project});
  final OurProjectEntity project;
  String weekText(int count) {
    if (count == 0) return '0 أسبوع';

    if (count == 1) return 'أسبوع';

    if (count == 2) return 'أسبوعين';

    if (count >= 3 && count <= 10) {
      return '$count أسابيع';
    }

    return '$count أسبوع';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.w(3)),
      decoration: BoxDecoration(
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
                      Expanded(child: _imageWidget(project.image2)),
                      Expanded(child: _imageWidget(project.image1)),
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
                  child: _label("قبل", context, Colors.black87),
                ),

                /// بعد
                Positioned(
                  top: 14,
                  right: 14,
                  child: _label("بعد", context, AppColors.kprimarycolor),
                ),

                /// بالتعاون
                if ((project.companyPartner?.isNotEmpty ?? false))
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
                if ((project.companyPartner?.isNotEmpty ?? false))
                  Row(
                    children: [
                      _imageWidget(
                        project.mainImage,
                        width: SizeConfig.w(30),
                        height: SizeConfig.h(30),
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Text(
                        project.companyPartner ?? '',
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.kprimarycolor),
                      ),
                    ],
                  ),

                SizedBox(height: SizeConfig.h(10)),

                Text(
                  project.nameAr ?? '',
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                SizedBox(height: SizeConfig.h(10)),

                Text(
                  project.descriptionAr ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: const Color(0xff777777)),
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
                    Expanded(
                      child: Text(
                        project.locationAr ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleRegular14(
                          context,
                        ).copyWith(color: const Color(0xff777777)),
                      ),
                    ),
                    SizedBox(width: SizeConfig.w(40)),
                    Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.kprimarycolor,
                      size: SizeConfig.isWideScreen
                          ? SizeConfig.w(15)
                          : SizeConfig.w(18),
                    ),
                    //    SizedBox(width: SizeConfig.w(6)),
                    Text(
                      toArabicNumbers(weekText(project.durationWeeks ?? 0)),
                      style: AppTextStyles.styleRegular14(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: OurProjectCardFooter(
                    projectId: project.id,
                    onEditPressed: () {
                      context.push('/editourprojectview', extra: project);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 safe image (network + fallback)
  Widget _imageWidget(String? url, {double? width, double? height}) {
    if (url == null || url.isEmpty) {
      return Container(color: Colors.grey.shade300);
    }

    return Image.network(
      url,
      fit: BoxFit.cover,
      width: width,
      height: height,
      errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade300),
    );
  }

  Widget _label(String text, BuildContext context, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        style: AppTextStyles.styleSemiBold13(
          context,
        ).copyWith(color: Colors.white),
      ),
    );
  }
}
