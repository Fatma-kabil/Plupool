import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/Qty_Btn.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(6),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/mach_pro2.png",
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(88),
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: SizeConfig.w(12)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "مضخة مياه عالية الكفاءة",
                    style: AppTextStyles.styleSemiBold14(
                      context,
                    ).copyWith(color: Color(0xff7B7B7B)),
                  ),
                  SizedBox(height: SizeConfig.h(5)),
                  Text(
                    "3000 EGP",
                    style: AppTextStyles.styleBold14(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  QtyBtn(
                    icon: Icons.remove,
                    backgroundcolor: Color(0xffCDCDCD),
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
                    child: Text(
                      "2",
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                  ),
                  QtyBtn(
                    icon: Icons.add,
                    backgroundcolor: AppColors.kprimarycolor,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          Divider(color: AppColors.textFieldBorderColor),
          Row(
            children: [
              Text(
                "6000 EGP ",
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              Text(
                "الإجمالي :",
                textDirection: TextDirection.rtl,
                style: AppTextStyles.styleMedium14(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              Spacer(),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    size: SizeConfig.w(18),
                    color: const Color(0xffEA5A65),
                  ),
                  label: Text(
                    "حذف",
                    style: AppTextStyles.styleBold14(
                      context,
                    ).copyWith(color: const Color(0xffEA5A65)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
