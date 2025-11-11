import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ServiceTabBar extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;
  final Map<String, int> counts;

  const ServiceTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
    required this.counts,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: counts.keys.map((tab) {
        final isSelected = selectedTab == tab;
        return Padding(
          padding: EdgeInsets.only(left: SizeConfig.w(8)),
          child: GestureDetector(
            onTap: () => onTabSelected(tab),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(10),
                vertical: SizeConfig.h(8),
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.kprimarycolor
                    : AppColors.kScaffoldColor,
                borderRadius: BorderRadius.circular(SizeConfig.w(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // ظل واضح
                    offset: const Offset(1, 2), // اتجاه الظل لتحت شوية
                    blurRadius: 1, // خفيف علشان يبان بارز مش ناعم
                    spreadRadius: 0, // انتشار بسيط يزود الإحساس بالعمق
                  ),
                ],
              ),
              child: Text(
                "$tab (${counts[tab]})",
                style: isSelected
                    ? AppTextStyles.styleBold14(
                        context,
                      ).copyWith(color: Colors.white)
                    : AppTextStyles.styleSemiBold14(
                        context,
                      ).copyWith(color: AppColors.kprimarycolor),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
