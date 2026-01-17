import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_card_footer.dart';

class ProductDetailsRow extends StatelessWidget {
  const ProductDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Image
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // غيري الرقم براحتك
          child: Image.asset(
            'assets/images/mach_pro2.png',
            height: SizeConfig.isWideScreen
                ? SizeConfig.w(88)
                : SizeConfig.h(88),
            width: SizeConfig.w(69),
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(width: SizeConfig.w(10)),

        /// Text section (IMPORTANT)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مضخه مياه عالية الكفاءة',
                softWrap: true,
                style: AppTextStyles.styleSemiBold14(
                  context,
                ).copyWith(color: const Color(0xff7B7B7B)),
              ),
              SizedBox(height: SizeConfig.h(8)),
              Text(
                '3000 EGP',
                textDirection: TextDirection.ltr,
                style: AppTextStyles.styleBold14(
                  context,
                ).copyWith(color: const Color(0xff333333)),
              ),
            ],
          ),
        ),

        SizedBox(width: SizeConfig.w(8)),

        /// Footer
        OfferCardFooter(),
      ],
    );
  }
}
