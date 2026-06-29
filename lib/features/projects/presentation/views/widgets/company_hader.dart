import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';

class CompanyHeader extends StatelessWidget {
  const CompanyHeader({super.key, required this.projects});

  final List<OurProjectEntity> projects;

  @override
  Widget build(BuildContext context) {
    final company = projects.first;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.kprimarycolor),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              company.mainImage ?? "",
              width: SizeConfig.w(30),
              height: SizeConfig.h(30),
              fit: BoxFit.cover,

              errorBuilder: (_, __, ___) =>
                  Container(color: Colors.grey.shade300),
            ),
          ),

          SizedBox(width: SizeConfig.w(8)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.handshake,
                    size: SizeConfig.w(16),
                    color: const Color(0xff777777),
                  ),

                  SizedBox(width: SizeConfig.w(4)),

                  Text(
                    "بالتعاون مع",
                    style: AppTextStyles.styleRegular13(
                      context,
                    ).copyWith(color: const Color(0xff777777)),
                  ),
                ],
              ),

              Text(
                company.companyPartner ?? "",
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: const Color(0xff333333)),
              ),
            ],
          ),

          const Spacer(),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(10),
              vertical: SizeConfig.h(6),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffCCE4F0),
            ),
            child: Text(
              toArabicNumbers(
                "${projects.length} ${projects.length == 1 ? 'مشروع' : 'مشاريع'}",
              ),
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
            ),
          ),
        ],
      ),
    );
  }
}
