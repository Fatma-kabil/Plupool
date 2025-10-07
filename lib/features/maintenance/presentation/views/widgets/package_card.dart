import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class PackageCard extends StatelessWidget {
  final String title;
  final List<String> services;
  final VoidCallback onSelect;

  const PackageCard({
    super.key,
    required this.title,
    required this.services,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: AppTextStyles.styleBold14(context),
          ),
          const SizedBox(height: 16),
          Container(
            height: 202,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffBBBBBB)),
              color: AppColors.kScaffoldColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: services
                  .map(
                    (service) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            service,
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.styleRegular16(context)
                                .copyWith(color: AppColors.ktextcolor),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            "assets/icons/done.svg",
                            height: SizeConfig.h(16),
                            width: SizeConfig.w(16),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 40),
          CustomTextBtn(
            text: "اختيار الباقة",
            width: double.infinity,
            onPressed: onSelect,
          ),
        ],
      ),
    );
  }
}
