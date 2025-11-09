import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/customer_info_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/pool_info_section.dart';

class CustomerDetailsViewBody extends StatelessWidget {
  const CustomerDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(8),
        vertical: SizeConfig.h(12),
      ),
      child: ListView(
        children: [
        
          const CustomerInfoCard(),
          SizedBox(height: SizeConfig.h(24)),
          const PoolInfoSection(), // ✅ استخدمنا الويدجت الجديدة هنا
        ],
      ),
    );
  }
}
