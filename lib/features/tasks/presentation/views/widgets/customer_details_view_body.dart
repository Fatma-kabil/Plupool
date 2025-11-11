import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/data/models/water_quality_model.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/customer_info_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/pool_info_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/required_services_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/water_quality_section.dart';

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
          const PoolInfoSection(),
          SizedBox(height: SizeConfig.h(24)),
          WaterQualitySection(
            data: WaterQualityModel(
              chlorineLevel: 2.5,
              phLevel: 7.2,
              temperature: 25,
              lastUpdated: DateTime.now(),
              note:
                  "لاحظت وجود تسريب بسيط في المواسير، يُفضل المتابعة خلال الزيارة القادمة.",
            ),
          ),
          SizedBox(height: SizeConfig.h(24)),
          RequiredServicesSection(),
          // ✅ استخدمنا الويدجت الجديدة هنا
        ],
      ),
    );
  }
}
