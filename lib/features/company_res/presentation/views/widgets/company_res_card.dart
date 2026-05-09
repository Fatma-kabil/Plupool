import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/company_res_details.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_header.dart';

class CompanyResCard extends StatelessWidget {
  const CompanyResCard({super.key,required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/companyresprofile',extra: user.id);
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
             CustomerHeader(user: user,),
            SizedBox(height: SizeConfig.h(8)),
            Divider(color: AppColors.textFieldBorderColor),
            SizedBox(height: SizeConfig.h(8)),
             CompanyResDetails(
              date: user.createdAt,
              companyName: user.companyName,
             ),
          ],
        ),
      ),
    );
  }
}
