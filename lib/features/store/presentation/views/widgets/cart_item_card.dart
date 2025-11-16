import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: SizeConfig.h(12),
      ),
      padding: EdgeInsets.all(SizeConfig.h(12)),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/product.png",
              width: SizeConfig.w(70),
              height: SizeConfig.h(88),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: SizeConfig.w(12)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مضخة مياه عالية الكفاءة",
                  style: AppTextStyles.styleSemiBold14(context).copyWith(color: Color(0xff7B7B7B)),
                ),
                SizedBox(height: SizeConfig.h(5)),
                Text(
                  "3000 EGP",
                  style: AppTextStyles.styleBold14(context).copyWith(color: AppColors.ktextcolor),
                ),
                SizedBox(height: SizeConfig.h(5)),
                Text(
                  "الإجمالي: 6000 EGP",
                  style: AppTextStyles.styleRegular14(context)
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  _qtyBtn(Icons.remove),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
                    child: Text(
                      "2",
                      style: AppTextStyles.styleSemiBold16(context),
                    ),
                  ),
                  _qtyBtn(Icons.add),
                ],
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text("حذف",
                    style: TextStyle(color: Colors.red)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Color(0xffE6F0FF),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: AppColors.kprimarycolor),
    );
  }
}
