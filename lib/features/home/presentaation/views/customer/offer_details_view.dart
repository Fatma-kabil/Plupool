import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/offer_details_view_body.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';

class OfferDetailsView extends StatelessWidget {
  const OfferDetailsView({super.key, required this.offers});
   final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(17),
              vertical: SizeConfig.h(25),
            ),
            child: OfferDetailsViewBody(offers:offers,),
          ),
        ),
      ),
    );
  }
}