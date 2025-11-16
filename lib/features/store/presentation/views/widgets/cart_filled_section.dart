import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_item_card.dart';

class CartFilledSection extends StatelessWidget {
  const CartFilledSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: SizeConfig.h(10)),
            itemCount: 3,
            itemBuilder: (_, i) => const CartItemCard(),
          ),
        ),

        // زر تأكيد الطلب
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(10),
            vertical: SizeConfig.h(10),
          ),
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.h(55),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kprimarycolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                "تأكيد الطلب",
                style: AppTextStyles.styleMedium20(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
