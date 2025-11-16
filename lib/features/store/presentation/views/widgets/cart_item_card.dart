import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_card_footer.dart';
import 'package:plupool/features/store/presentation/views/widgets/qty_section.dart';

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
              QtySection(),
            ],
          ),
          SizedBox(height: SizeConfig.ismidwidthScreen ? SizeConfig.h(8) : 0),
          Divider(color: AppColors.textFieldBorderColor),
          CartCardFooter(),
        ],
      ),
    );
  }
}
