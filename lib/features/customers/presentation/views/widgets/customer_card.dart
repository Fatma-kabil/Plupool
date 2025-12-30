import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_details.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_header.dart';
class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        children: [
          const CustomerHeader(),
          SizedBox(height: SizeConfig.h(8)),
          Divider(color: AppColors.textFieldBorderColor),
          SizedBox(height: SizeConfig.h(8)),
          const CustomerDetails(),
        ],
      ),
    );
  }
}
