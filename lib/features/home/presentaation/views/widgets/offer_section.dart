import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_carousel.dart';

class OfferSection extends StatelessWidget {
  final List<OfferModel> offers;
  final String role; // أضف هذا
  const OfferSection({super.key, required this.offers, required this.role});

  @override
  Widget build(BuildContext context) {
     print("🔥 ROLE INSIDE CARD = $role");
    return Column(
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              'عروضنا الخاصة',
              style: AppTextStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (role == "فني") {
                  // لو فني ينفذ التغيير العادي
                  context.read<BottomNavCubit>().changeCurrentIndex(
                    2,
                    filter: StoreFilter.discount,
                  );
                } else {}
              },
              child: Text(
                ' عرض الكل',
                style: AppTextStyles.styleSemiBold16(context).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.h(16)),
        OffersCarousel(offers: offers),
      ],
    );
  }
}
