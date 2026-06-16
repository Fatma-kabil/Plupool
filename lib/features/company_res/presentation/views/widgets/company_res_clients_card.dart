import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/company_res/domain/entities/client_entity.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_status.dart';

class CompanyResClientsCard extends StatelessWidget {
  const CompanyResClientsCard({super.key, required this.client});

  final ClientEntity client;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //  final navContext = Navigator.of(context).context;

        //   final result = await
        context.push('/customerprofileview', extra: client.id);

        //  if (result == true) {
        // ignore: use_build_context_synchronously
        //  navContext.read<UsersCubit>().refresh();
        //  }
      },
      child: Container(
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
            Row(
              children: [
                CustomerAvatar(imageUrl: client.profileImage),
                SizedBox(width: SizeConfig.w(7)),
                CustomerInfo(name: client.fullName, phone: client.phone),
                const Spacer(),
                CustomerStatus(isActive: client.isActive),
              ],
            ),

            SizedBox(height: SizeConfig.h(8)),
            Divider(color: AppColors.textFieldBorderColor),
            SizedBox(height: SizeConfig.h(8)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomerInfoItem(
                  icon: Icons.pool,
                  title: "نوع المسبح",
                  value: client.poolTypeName ?? "غير محدد",
                ),
                CustomerInfoItem(
                  icon: Icons.location_on,
                  title: "العنوان",
                  value: client.address ?? "غير متوفر",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
