import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

class OfferViewBody extends StatelessWidget {
  const OfferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "إدارة العروض",
                style: AppTextStyles.styleSemiBold16(context),
              ),
              AddOfferBtn(),
            ],
          ),
          SizedBox(height: SizeConfig.h(15)),
        ],
      ),
    );
  }
}
