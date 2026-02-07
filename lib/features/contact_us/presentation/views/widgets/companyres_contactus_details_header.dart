import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/header_row.dart';
import 'package:plupool/features/customers/presentation/views/widgets/container_status.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';

class CompanyresContactusDetailsHeader extends StatelessWidget {
  const CompanyresContactusDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CustomerAvatar(),
              SizedBox(width: SizeConfig.w(7)),
              const CustomerInfo(),
              const Spacer(),
              ContainerStatus(isActive: true),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),
          Divider(),
          SizedBox(height: SizeConfig.h(8)),
          HeaderRow(label: "اسم الشركة:", value: "شركة التقنية المتطورة"),
           SizedBox(height: SizeConfig.h(8)),
          HeaderRow(label: "مسئول التواصل", value: "أحمد محمد"),
           SizedBox(height: SizeConfig.h(8)),
          HeaderRow(label: "نوع المشروع", value: "بناء حمامات سباحة"),
           SizedBox(height: SizeConfig.h(8)),
          HeaderRow(label: "رقم الموبايل", value: "01558098364"),
        ],
      ),
    );
  }
}
