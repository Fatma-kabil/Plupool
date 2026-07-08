import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_section_entity.dart';

class MaintenancePoolCard extends StatelessWidget {
  const MaintenancePoolCard({super.key, required this.section});

  final MaintenanceSectionEntity section;

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
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(10),
            vertical: SizeConfig.h(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  section.imageUrl,
                  height: SizeConfig.isWideScreen
                      ? SizeConfig.w(170)
                      : SizeConfig.h(186),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => SizedBox(
                    height: SizeConfig.h(186),
                    child: Center(child: Icon(Icons.image_not_supported)),
                  ),
                ),
              ),

              SizedBox(height: SizeConfig.h(8)),

              Text(
                section.titleAr,
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.kprimarycolor),
              ),

              const SizedBox(height: 8),

              Column(
                children: section.features.map((feature) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
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
                          child: Text(
                            feature,
                            style: AppTextStyles.styleRegular16(
                              context,
                            ).copyWith(color: const Color(0xff777777)),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
