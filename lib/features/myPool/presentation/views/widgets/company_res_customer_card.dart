import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';

class CompanyResCustomerCard extends StatelessWidget {
  const CompanyResCustomerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(12),
      ),
      margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomerAvatar(imageUrl: "assets/images/user1.png"),
              SizedBox(width: SizeConfig.w(7)),
              CustomerInfo(name: "أحمد محمد", phone: "01000000000"),
            ],
          ),
          SizedBox(height: SizeConfig.h(6)),
        Divider(),
        SizedBox(height: SizeConfig.h(6)),

          CustomerInfoItem(
            crossAxisAlignment: CrossAxisAlignment.start,
            icon: Icons.pool_outlined,
            title: "النوع",
            value: "مسبح خاص",
          ),
          SizedBox(height: SizeConfig.h(12)),

          CustomerInfoItem(
            crossAxisAlignment: CrossAxisAlignment.start,
            icon: Icons.location_on_outlined,
            title: "العنوان",
            value: "شارع 123، مدينة، دولة",
          ),
        ],
      ),
    );
  }
}
