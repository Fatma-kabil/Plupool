import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerCard extends StatelessWidget {
  CustomerCard({super.key});
  bool isActive = true;

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
          Row(
            children: [
              CircleAvatar(
                radius: SizeConfig.w(15),

                backgroundImage: const AssetImage('assets/images/user1.png'),
              ),
              SizedBox(width: SizeConfig.w(7)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "أحمد محمد ",
                    style: AppTextStyles.styleSemiBold16(context),
                  ),
                  Row(
                    children: [
                      Text(
                        " 01151234567",
                        style: AppTextStyles.styleMedium16(
                          context,
                        ).copyWith(color: AppColors.kprimarycolor),
                      ),
                      SizedBox(width: SizeConfig.w(2)),
                      Icon(
                        Icons.phone,
                        size: SizeConfig.w(14),

                        color: AppColors.kprimarycolor,
                      ),
                    ],
                  ),
                ],
              ),

              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: SizeConfig.w(10),
                    color: isActive ? Color(0xff05B285) : Color(0xffE63946),
                  ),
                  SizedBox(width: SizeConfig.w(4)),
                  Text(
                    isActive ? "نشط" : "غير نشط",
                    style: AppTextStyles.styleSemiBold16(context).copyWith(
                      color: isActive ? Color(0xff05B285) : Color(0xffE63946),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),
          Divider(color: AppColors.textFieldBorderColor),
          SizedBox(height: SizeConfig.h(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: SizeConfig.w(14),
                        color: AppColors.kprimarycolor,
                      ),
                      Text(
                        " تاريخ الانضمام",
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.h(4)),
                  Text(
                    "20/12/2025",
                    style: AppTextStyles.styleMedium16(
                      context,
                    ).copyWith(color: Color(0xff777777)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: SizeConfig.w(14),
                        color: AppColors.kprimarycolor,
                      ),
                      Text(
                        "العنوان",
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.h(4)),
                  Text(
                    "مدينة نصر ، القاهرة",
                    style: AppTextStyles.styleMedium16(
                      context,
                    ).copyWith(color: Color(0xff777777)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
