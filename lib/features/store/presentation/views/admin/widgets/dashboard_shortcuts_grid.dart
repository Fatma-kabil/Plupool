import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/admin/widgets/shortcut_btn.dart';

class DashboardShortcutsGrid extends StatelessWidget {
  const DashboardShortcutsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dashboardShortcuts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: SizeConfig.isWideScreen ? 2.9 : 2.4,

          crossAxisSpacing: SizeConfig.w(12),
          mainAxisSpacing: SizeConfig.h(16),
        ),
        itemBuilder: (context, index) {
          return ShortcutButton(model: dashboardShortcuts[index]);
        },
      ),
    );
  }
}
