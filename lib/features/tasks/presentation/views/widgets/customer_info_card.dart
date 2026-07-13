import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/location_row.dart';
import 'package:plupool/features/tasks/domain/entities/client_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/info_col.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/section_header.dart';

class CustomerInfoCard extends StatelessWidget {
  const CustomerInfoCard({
    super.key,
    required this.client,
  });

  final ClientEntity client;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.textFieldBorderColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          const SectionHeader(
            icon: Icons.person,
            title: "تفاصيل العميل",
          ),

          SizedBox(height: SizeConfig.h(12)),

          InfoCol(
            label: "اسم العميل:",
            value: client.fullName,
          ),

          SizedBox(height: SizeConfig.h(12)),

          InfoCol(
            label: "العنوان:",
            value: client.locationAddress,
          ),

          SizedBox(height: SizeConfig.h(10)),

          LocationRow(
            location: client.locationName,
          ),
        ],
      ),
    );
  }
}