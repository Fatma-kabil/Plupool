import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/previous_value_section.dart';

class MaintenanceUpdateViewBody extends StatelessWidget {
  const MaintenanceUpdateViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         PreviousValuesSection(),
         SizedBox(height: SizeConfig.h(20)),
          // أضف المزيد من عناصر واجهة المستخدم حسب الحاجة
        ],
      ),
    );
  }
}