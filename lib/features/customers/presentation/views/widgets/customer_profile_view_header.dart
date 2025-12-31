import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/location_row.dart';
import 'package:plupool/features/customers/presentation/views/widgets/container_status.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/info_col.dart';

class CustomerProfileViewHeader extends StatelessWidget {
  const CustomerProfileViewHeader({super.key});

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
          const InfoCol(
            label: "العنوان:",
            value: "٢٨٧ شارع النخيل، الإسكندرية، مصر",
          ),
          SizedBox(height: SizeConfig.h(8)),
          LocationRow(location: "٢٨٧ شارع النخيل، الإسكندرية، مصر"),
          SizedBox(height: SizeConfig.h(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddOfferBtn(
                padding: 10,
                text: "تعديل البيانات",
                icon: Icons.edit_document,
                style: AppTextStyles.styleSemiBold14(
                  context,
                ).copyWith(color: AppColors.kprimarycolor),
              ),
              AddOfferBtn(
                padding: 10,
                text: "إرسال إشعار",
                icon: Icons.notification_add,
                style: AppTextStyles.styleSemiBold14(
                  context,
                ).copyWith(color: AppColors.kprimarycolor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
