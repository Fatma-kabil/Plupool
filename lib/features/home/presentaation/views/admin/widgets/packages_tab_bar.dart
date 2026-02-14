import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PackagesTabBar extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;
  final Map<String, int> counts;
  final double? borderRaduis;

  const PackagesTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
    required this.counts, this.borderRaduis,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: counts.keys.map((tab) {
        final isSelected = selectedTab == tab;
        return Padding(
          padding: EdgeInsets.only(left: SizeConfig.w(8)),
          child: GestureDetector(
            onTap: () => onTabSelected(tab),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(18),
                vertical: SizeConfig.h(10),
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.kprimarycolor : Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(borderRaduis?? SizeConfig.w(20)),
              ),
              child: Text(
                "$tab (${counts[tab]})",
                style: isSelected
                    ? AppTextStyles.styleBold14(
                        context,
                      ).copyWith(color: Colors.white)
                    : AppTextStyles.styleSemiBold14(
                        context,
                      ).copyWith(color: Color(0xff999999)),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
