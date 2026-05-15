import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/presentation/views/widgets/container_status.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

class CompanyResProfileViewHeader extends StatelessWidget {
  const CompanyResProfileViewHeader({super.key, required this.user});
  final UserEntity user;
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
               CustomerAvatar(
                imageUrl: user.profileImage,
               ),
              SizedBox(width: SizeConfig.w(7)),
                 CustomerInfo(
                  name: user.fullName,
                  phone: user.phone,
                 ),
              const Spacer(),
              ContainerStatus(isActive: user.isActive),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),
          Text(
            "اسم الشركة:",
            style: AppTextStyles.styleRegular16(
              context,
            ).copyWith(color: Color(0xff555555)),
          ),
          Text(
            user.companyName ??"لا يوجد",
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddOfferBtn(
                padding: 8,
                text: "تعديل البيانات",
                icon: Icons.edit_document,
                style: AppTextStyles.styleSemiBold14(
                  context,
                ).copyWith(color: AppColors.kprimarycolor),
                onTap: () {
                  context.push('/editcompanyresview',extra: user);
                },
              ),
              AddOfferBtn(
                padding: 8,
                text: "إرسال إشعار",
                icon: Icons.notification_add,
                style: AppTextStyles.styleSemiBold14(
                  context,
                ).copyWith(color: AppColors.kprimarycolor),
                onTap: () {
                  context.push('/addnotificationsview');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
