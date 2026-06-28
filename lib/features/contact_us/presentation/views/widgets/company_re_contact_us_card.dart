import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';
import 'package:plupool/features/support/presentation/views/widgets/details_btn.dart';

class CompanyReContactUsCard extends StatelessWidget {
  const CompanyReContactUsCard({super.key, required this.model, this.onTap});
  final ContactMessageEntity model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final statu = mapMessageApiStatus(model.status);
    final colors = MessageStatusColors.getColors(statu);
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'تاريخ الإرسال',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              SizedBox(height: SizeConfig.h(15)),
              Text(
                formatDate(model.createdAt),
                style: AppTextStyles.styleSemiBold14(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
            ],
          ),

          Column(
            children: [
              Text(
                'الحالة',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              SizedBox(height: SizeConfig.h(15)),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.h(5),
                  horizontal: SizeConfig.w(15),
                ),
                decoration: BoxDecoration(
                  color: colors['labelBg'],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                statusText2(  model.status),
                  style: AppTextStyles.styleSemiBold14(
                    context,
                  ).copyWith(color: colors['labelText']),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'الإجراء',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              SizedBox(height: SizeConfig.h(15)),
              DetailsBtn(onTap: onTap),
            ],
          ),
        ],
      ),
    );
  }
}
