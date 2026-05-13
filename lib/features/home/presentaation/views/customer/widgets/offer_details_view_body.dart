import 'package:flutter/cupertino.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/offer_details_card.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';

class OfferDetailsViewBody extends StatelessWidget {
  const OfferDetailsViewBody({super.key, required this.offers});
   final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: offers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:  EdgeInsets.only( bottom:  SizeConfig.h(12)),
          child: OfferDetailsCard(offer: offers[index],),
        );
      },
    );
  }
}
